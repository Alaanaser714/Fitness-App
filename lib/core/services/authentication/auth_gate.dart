
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../view/screens/home/home.dart';
import '../../../view/screens/auth/login.dart';
import '../../../view/screens/settings/setting_options/setting_options.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData)
              if (FirebaseAuth.instance.currentUser!.emailVerified) {
                return SettingOptions();
              }
              return const Login_Screen();
          },) ,
    );
  }
}
