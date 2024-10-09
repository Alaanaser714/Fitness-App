// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/services/authentication/auth_service.dart';

class Home extends StatelessWidget {
   Home({super.key});
  AuthService auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          TextButton(onPressed: auth.signOut, child: const Text("sign out"))
        ],
      ),
    );
  }
}
