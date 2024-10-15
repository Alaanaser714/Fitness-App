
// ignore_for_file: avoid_print, body_might_complete_normally_catch_error, deprecated_member_use, prefer_is_empty

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../fire_store&storage/fire_store&storage.dart';

class AuthService{
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore fireStore=FirebaseFirestore.instance;
  FireStoreStorage fireStoreStorage=FireStoreStorage();

  Future<UserCredential> signInWithEmailAndPassword({required String email,required String password}) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((onValue) {
      return onValue;
    }).catchError((e) {print(e.toString());
    });

  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    User? user = userCredential.user;
    if (user != null) {
      fireStoreStorage.getProfileData().then((onValue){
        if(onValue.length==0){
          String? name = user.displayName;
          String? email = user.email;
          String? id = user.uid;
          fireStore.collection("Users").doc(id).set({
            'uid':id,
            'email':email,
            'name':name,
            'imageProfile':'https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2264922221.jpg'
          });
        }

      }).catchError((onError){

      });






    }

    // Once signed in, return the UserCredential
return userCredential;


  }

  Future<UserCredential> signUpWithEmailAndPassword({required String email,required String password,required String name}) async {
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((onValue) async {
      // await onValue.user?.sendEmailVerification();
      firebaseAuth.currentUser!.sendEmailVerification();
      fireStore.collection("Users").doc(onValue.user!.uid).set({
        'uid':onValue.user!.uid,
        'email':email,
        'name':name,
        'imageProfile':'https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2264922221.jpg'
      });
      return onValue;
    }).catchError((onError){
      print(onError.toString());
    });
  }

  User? getCurrentUser(){
    return firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
  await firebaseAuth.signOut();
}

  Future<bool> updatePassword(String newPassword) async {
    User? user = firebaseAuth.currentUser;

    if (user != null) {

        await user.updatePassword(newPassword).then((onValue){
          return true;
        }).catchError((onError){
          print(onError.toString());
        });

    }
    return false;
  }

  Future<UserCredential> reauthenticateUser(String email, String password) async {
    User? user = FirebaseAuth.instance.currentUser;
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

       return await user!.reauthenticateWithCredential(credential).then((onValue){
          return onValue;
        }).catchError((onError){
         print(onError.toString());
        });


  }

  Map checkSignInMethod() {
    User? user = firebaseAuth.currentUser;
      for (UserInfo provider in user!.providerData) {
        print('Provider ID: ${provider.providerId}');
        print('Email: ${provider.email}');
        print('Display Name: ${provider.displayName}');
        return {
          'providerId':provider.providerId,
          'email':provider.email,
          'name':provider.displayName,
          'imageProfile':provider.photoURL
        };
      }
     return {};

}}