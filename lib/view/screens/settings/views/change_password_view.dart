// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:fitness_app/core/services/authentication/auth_gate.dart';
import 'package:fitness_app/core/services/authentication/auth_service.dart';
import 'package:fitness_app/core/shared/componans.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  AuthService auth = AuthService();

  void _checkPasswords() {
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      // بيشيك لو واحده فيهم فاضيه
      _showMessage("Please fill in both fields.");
    } else if (newPassword == confirmPassword) {
      _showMessage("Passwords match. Proceeding to save...");
      Timer(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthGate(),
          ),
          (route) => false,
        );
        auth.updatePassword(newPassword).then((onValue) {
          defaultToast('Password Changed', Colors.green);
        }).catchError((onError) {
          defaultToast('failed!', Colors.red);
        });
      });
    } else {
      _showMessage("Passwords do not match. Please try again.");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.orange),
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        title: const Text(
          'Change password',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const Text(
                  'Set a good password by using a combination of lowercase and uppercase letters, numbers, and symbols.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                        )),
                    hintText: 'New password',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                        )),
                    hintText: 'Confirm password',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: _checkPasswords,
                  child: const Text('Save',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
