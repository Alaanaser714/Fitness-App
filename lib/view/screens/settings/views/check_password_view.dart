// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, prefer_const_constructors

import 'package:fitness_app/core/services/authentication/auth_service.dart';
import 'package:fitness_app/view/screens/settings/views/change_password_view.dart';
import 'package:flutter/material.dart';

class CheckPasswordView extends StatefulWidget {
  const CheckPasswordView({super.key});

  @override
  _CheckPasswordViewState createState() => _CheckPasswordViewState();
}

class _CheckPasswordViewState extends State<CheckPasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  AuthService auth = AuthService();

  void validatePassword() {
    auth
        .reauthenticateUser(
            auth.getCurrentUser()!.email.toString(), _passwordController.text)
        .then((onValue) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChangePasswordView(),
        ),
      );
    }).catchError((onError) {
      _showErrorMessage("Incorrect password. Please try again.");
    });
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Password',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Center(
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'To set a new password, please enter your current password first.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
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
                          borderSide: BorderSide(
                            color: Colors.orange,
                          )),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: validatePassword,
                    child: const Text('Continue',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
