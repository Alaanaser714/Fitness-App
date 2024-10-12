import 'package:fitness_app/core/services/authentication/auth_service.dart';
import 'package:fitness_app/view/screens/settings/setting_widgets/setting_types.dart';
import 'package:fitness_app/view/screens/settings/views/check_password_view.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
   AccountView({super.key});
  AuthService auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
