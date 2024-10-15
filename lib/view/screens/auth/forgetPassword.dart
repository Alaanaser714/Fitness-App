// ignore_for_file: file_names, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/services/authentication/auth_service.dart';
import 'package:fitness_app/view/screens/auth/login.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailcontroller = TextEditingController();
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Forgot Password",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Image.asset(
            "assets/images/fitness_icon.png",
            width: 100,
          ),
          const Text(
            "Please enter your email to recover the password",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.white),
                color: const Color.fromARGB(255, 141, 139, 139),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: 'enter your email ',
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
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            color: const Color.fromARGB(255, 29, 31, 33),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () async {
                  if (_emailcontroller.text == "") {
                    return AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.bottomSlide,
                            title: 'Error',
                            desc: 'Please Enter your first!! ',
                            btnCancelOnPress: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login_Screen(),
                                ),
                                (route) => false,
                              );
                            },
                            btnOkOnPress: () {})
                        .show();
                  } else {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.bottomSlide,
                        title: 'Warning',
                        desc: 'Go to your email to reset password  ',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () async {
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: _emailcontroller.text);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login_Screen(),
                            ),
                            (route) => false,
                          );
                        }).show();
                  }
                },
                child: const Text(
                  "continue",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                )),
          ),
        ],
      ),
    );
  }
}
