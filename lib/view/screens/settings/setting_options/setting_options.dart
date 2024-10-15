// ignore_for_file: must_be_immutable

import 'package:fitness_app/core/services/authentication/auth_gate.dart';
import 'package:fitness_app/view/screens/settings/setting_widgets/setting_types.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/authentication/auth_service.dart';
import '../views/edit.dart';
import '../views/feedback_view.dart';
import '../views/help_view.dart';

class SettingOptions extends StatelessWidget {
  AuthService auth = AuthService();
  SettingOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            InkWell(
              //Acount page
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => edit()),
              ),
              child: getSettingType(icon: Icons.person, text: 'Account'),
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.2,
              indent: 35,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            InkWell(
              //Help page
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpView(),
                ),
              ),
              child: getSettingType(
                icon: Icons.help,
                text: 'Help & Support',
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.2,
              indent: 35,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            InkWell(
                //Feedback page
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedbackView(),
                      ),
                    ),
                child: getSettingType(icon: Icons.feedback, text: 'Feedback')),
            const Divider(
              color: Colors.white,
              thickness: 0.2,
              indent: 35,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            InkWell(
              //Logout dialog
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                          onPressed: () {
                            auth.signOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AuthGate(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'Log Out',
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ),
                );
              },
              child: getSettingType(
                  icon: Icons.logout,
                  text: 'LogOut',
                  textColor: Colors.red,
                  iconColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
