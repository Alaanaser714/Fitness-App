import 'package:fitness_app/view/screens/settings/feedback_view.dart';
import 'package:fitness_app/view/screens/settings/help_view.dart';
import 'package:fitness_app/view/screens/settings/notifications_view.dart';
import 'package:flutter/material.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 25, 26, 29),
          Color.fromARGB(255, 36, 38, 42)
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
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
                  text: 'Help',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                  //Feedback page
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeedbackView(),
                        ),
                      ),
                  child:
                      getSettingType(icon: Icons.feedback, text: 'Feedback')),
              const SizedBox(height: 10),
              InkWell(
                  //Notification page
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsView(),
                        ),
                      ),
                  child: getSettingType(
                      icon: Icons.notifications, text: 'notifications')),
              const SizedBox(height: 10),
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
                            child: const Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              //put the logout logic here ya Abo Alaa
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
      ),
    );
  }
}

Widget getSettingType(
    {required IconData icon,
    required String text,
    Color? textColor,
    Color? iconColor}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFF3C3C3C),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor ?? const Color(0xFFF2994A)),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  );
}
