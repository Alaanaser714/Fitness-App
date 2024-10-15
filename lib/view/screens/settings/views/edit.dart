// ignore_for_file: camel_case_types, must_be_immutable, unused_field

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/core/services/authentication/auth_service.dart';
import 'package:fitness_app/core/services/fire_store&storage/fire_store&storage.dart';
import 'package:fitness_app/core/shared/componans.dart';
import 'package:fitness_app/view/screens/settings/views/check_password_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class edit extends StatefulWidget {
  edit({super.key});
  var fireStoreStorage = FireStoreStorage();
  AuthService authService = AuthService();
  File? _image;
  String? _downloadURL;
  final ImagePicker _picker = ImagePicker();
  String imageProfile = '';
  String nameProfile = '';

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  AuthService auth = AuthService();
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();
  bool isNameChanged = false;
  bool isImageChanged = false;
  bool isUpdate = false;

  @override
  void initState() {
    super.initState();

    widget.fireStoreStorage.getProfileData().then((onValue) {
      widget.imageProfile = onValue['imageProfile'];
      widget.nameProfile = onValue['name'];

      _firstname.text = widget.nameProfile.split(' ')[0];
      if (widget.nameProfile.split(' ').length > 1) {
        _lastname.text = widget.nameProfile.split(' ')[1];
      }
      setState(() {});
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            widget.imageProfile == '' ? Colors.black : Colors.orange,
        body: SafeArea(
          child: widget.imageProfile == ''
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.orange,
                ))
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 40,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.15,
                        height: MediaQuery.of(context).size.height * 1,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 29, 31, 33),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.08,
                        left: MediaQuery.of(context).size.width * 0.35,
                        child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            radius: 55,
                            backgroundImage: widget._image != null
                                ? FileImage(widget._image!)
                                : widget.imageProfile == ''
                                    ? const AssetImage(
                                        'assets/images/Default_pfp.svg.png',
                                      )
                                    : NetworkImage(widget.imageProfile)),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.15,
                          left: MediaQuery.of(context).size.width * 0.55,
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.white),
                            icon: const Icon(
                              Icons.photo,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              widget.fireStoreStorage
                                  .pickImage(ImageSource.gallery, widget._image,
                                      widget._picker)
                                  .then((onValue) {
                                widget._image = onValue;
                                isImageChanged = true;
                                setState(() {});
                              }).catchError((onError) {});
                              setState(() {});
                            },
                          )),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.15,
                          left: MediaQuery.of(context).size.width * 0.28,
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.white),
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              widget.fireStoreStorage
                                  .pickImage(ImageSource.camera, widget._image,
                                      widget._picker)
                                  .then((onValue) {
                                widget._image = onValue;
                                isImageChanged = true;
                                setState(() {});
                              }).catchError((onError) {});
                              setState(() {});
                            },
                          )),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.27,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "assets/images/Google - png 0.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      widget.authService
                                          .checkSignInMethod()['email'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                            const Text(
                              "Edit Profile",
                              style:
                                  TextStyle(fontSize: 35, color: Colors.orange),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1, color: Colors.orange),
                                  color:
                                      const Color.fromARGB(255, 141, 139, 139),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextField(
                                    onChanged: (value) {
                                      isNameChanged = true;
                                    },
                                    obscureText: false,
                                    controller: _firstname,
                                    decoration: const InputDecoration(
                                        hintText: 'First name',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1, color: Colors.orange),
                                  color:
                                      const Color.fromARGB(255, 141, 139, 139),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextField(
                                    onChanged: (value) {
                                      isNameChanged = true;
                                    },
                                    obscureText: false,
                                    controller: _lastname,
                                    decoration: const InputDecoration(
                                        hintText: 'Last name',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange),
                                  onPressed: () {
                                    if (isNameChanged && isImageChanged) {
                                      isUpdate = true;
                                      setState(() {});
                                      widget.fireStoreStorage
                                          .uploadImage(widget._image,
                                              widget._downloadURL)
                                          .then((onValue) {
                                        isImageChanged = false;
                                        FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(widget.authService
                                                .getCurrentUser()!
                                                .uid)
                                            .update({
                                          'name':
                                              '${_firstname.text} ${_lastname.text}',
                                        }).then((onValue) {
                                          isUpdate = false;
                                          isNameChanged = false;
                                          defaultToast('Updated Successfully',
                                              Colors.green);
                                          setState(() {});
                                        });
                                        setState(() {});
                                      }).catchError((onError) {
                                        defaultToast(
                                            'Uploaded Error', Colors.red);
                                        isUpdate = false;
                                        isImageChanged = false;
                                        isNameChanged = false;
                                        setState(() {});
                                      });
                                    } else if (isImageChanged) {
                                      isUpdate = true;
                                      setState(() {});
                                      widget.fireStoreStorage
                                          .uploadImage(widget._image,
                                              widget._downloadURL)
                                          .then((onValue) {
                                        isUpdate = false;
                                        isImageChanged = false;
                                        defaultToast('Updated Successfully',
                                            Colors.green);
                                        setState(() {});
                                      }).catchError((onError) {
                                        defaultToast('error', Colors.red);
                                        isUpdate = false;
                                        isImageChanged = false;
                                        setState(() {});
                                      });
                                    } else if (isNameChanged) {
                                      isUpdate = true;
                                      setState(() {});
                                      FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(widget.authService
                                              .getCurrentUser()!
                                              .uid)
                                          .update({
                                        'name':
                                            '${_firstname.text} ${_lastname.text}',
                                      }).then((onValue) {
                                        isUpdate = false;
                                        isNameChanged = false;
                                        defaultToast('Updated Successfully',
                                            Colors.green);
                                        setState(() {});
                                      }).catchError((onError) {
                                        defaultToast('error', Colors.red);
                                        isUpdate = false;
                                        isImageChanged = false;
                                        setState(() {});
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      isUpdate
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const Text(
                                              "Update",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            )
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                           if (!(auth.checkSignInMethod()['providerId'].toString().compareTo('google.com')==0))
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckPasswordView(),
                                        ));
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Change Password",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.03,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )),
                    ],
                  ),
                ),
        ));
  }
}
