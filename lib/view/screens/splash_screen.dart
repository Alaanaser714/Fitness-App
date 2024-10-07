// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:fitness_app/view/screens/onboarding_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingView(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff353A40),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 186,
              ),
              Image.asset("assets/images/splash_logo.png"),
              Text(
                "Helios Sports Tech",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Here To Compete.",
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
