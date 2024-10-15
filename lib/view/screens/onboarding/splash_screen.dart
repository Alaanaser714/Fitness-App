// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:fitness_app/view/screens/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import '../../../core/services/authentication/auth_gate.dart';
import '../../../core/shared/cash_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget startScreen() {
    if (CashHelper.getData('splash') != null) {
      return const AuthGate();
    }
    return const OnboardingView();
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => startScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              Image.asset(
                "assets/images/fitness_icon.png",
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Text(
                "Welcome to Your Fitness App",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your journey to a healthier, stronger you starts here!",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(
                      0xffC0C0C0,
                    )),
              ),
            ],
          ),
        ));
  }
}
