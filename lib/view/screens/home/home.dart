// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../core/services/authentication/auth_service.dart';
import '../settings/setting_options/setting_options.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingOptions(),
                    ));
              },
              icon: const Icon(
                Icons.settings,
                size: 35,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
