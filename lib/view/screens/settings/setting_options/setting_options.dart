// ignore_for_file: must_be_immutable

import 'package:fitness_app/view/screens/settings/views/account_view.dart';
import 'package:fitness_app/view/screens/settings/views/feedback_view.dart';
import 'package:fitness_app/view/screens/settings/views/help_view.dart';
import 'package:fitness_app/view/screens/settings/views/notifications_view.dart';
import 'package:fitness_app/view/screens/settings/setting_widgets/setting_types.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/authentication/auth_service.dart';

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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

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
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                      //Feedback page
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FeedbackView(),
                            ),
                          ),
                      child: getSettingType(
                          icon: Icons.feedback, text: 'Feedback')),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.2,
                    indent: 35,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                      //Notification page
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationsView(),
                            ),
                          ),
                      child: getSettingType(
                          icon: Icons.notifications, text: 'Notifications')),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.2,
                    indent: 35,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    //Logout dialog
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Confirm Logout'),
                          content:
                              const Text('Are you sure you want to log out?'),
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
                                  Navigator.pop(context);
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
          ],
        ),
      ),
    );
  }
}