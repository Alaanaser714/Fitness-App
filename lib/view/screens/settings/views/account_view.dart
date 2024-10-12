

// ignore_for_file: must_be_immutable

import 'package:fitness_app/view/screens/settings/views/check_password_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/authentication/auth_service.dart';
import '../setting_widgets/setting_types.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              auth.checkSignInMethod()['providerId']=='google.com'?
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Google - png 0.png"),
                  const SizedBox(
                    width: 10,
                  ),
                   Expanded(
                     child: Text(
                      auth.checkSignInMethod()['email'],
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                                       ),
                   )
                ],
              ):
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>   const CheckPasswordView(),
                  ),
                ),
                child: getSettingType(icon: Icons.password, text: 'Password'),
              )
              ,
              const Divider(
                color: Colors.white,
                indent: 35,
                thickness: 0.2,
              )
            ],
          ),
        ),
      ),
    );
  }
}