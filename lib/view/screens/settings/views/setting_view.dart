import 'package:fitness_app/view/screens/settings/setting_options/setting_options.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingOptions(),
    );
  }
}
