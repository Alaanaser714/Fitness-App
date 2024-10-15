//ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: file_names, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../authentication/auth_service.dart';

class FireStoreStorage{
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<Map> getProfileData() async {
    // Reference to the document you want to retrieve
    DocumentReference documentReference = fireStore.collection('Users').doc(AuthService().getCurrentUser()!.uid);
    // Fetch the document
    DocumentSnapshot documentSnapshot = await documentReference.get();

    // Access the specific field you want to retrieve
    if (documentSnapshot.exists) {
      String imageProfile = documentSnapshot.get('imageProfile');
      String name = documentSnapshot.get('name');
      return {
        "imageProfile":imageProfile,
        'name':name
      };
    }
    return {

    };
  }
  Future<void> uploadImage(_image,_downloadURL) async {

    if (_image == null) return;

    try {
      // Create a reference to the Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child('uploads/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Save the file to Firebase Storage
      await storageRef.putFile(_image!);

      // Get the download URL for the uploaded image
      String downloadURL = await storageRef.getDownloadURL();

      AuthService authService = AuthService();
      fireStore.collection('Users').doc(authService.getCurrentUser()!.uid).update(
          {
            'imageProfile':downloadURL
          });
        _downloadURL = downloadURL;


      print('Image uploaded and download URL: $_downloadURL');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
  Future pickImage(ImageSource source,_image,_picker) async {
    final pickedFile = await _picker.pickImage(source: source);


      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print("image so 111111111111122222222222222222211111111"+_image!.path);
        return _image;
      } else {
        print('No image selected.');
      }

  }



}