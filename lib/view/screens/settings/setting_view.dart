import 'package:fitness_app/view/screens/settings/setting_options.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        title: const Center(
          child: Text(
            'Setting',
            style: TextStyle(
              color: Color.fromARGB(255, 161, 161, 170),
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: const SettingOptions(),
    );
  }
}


// هتعمل الكلام اللي جوه كل صفحه وهتعمل اب بار باسم الصفحه