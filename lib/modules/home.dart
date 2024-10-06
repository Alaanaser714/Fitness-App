import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/authentication/auth_service.dart';

class Home extends StatelessWidget {
   Home({super.key});
  AuthService auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          TextButton(onPressed: auth.signOut, child: Text("sign out"))
        ],
      ),
    );
  }
}
