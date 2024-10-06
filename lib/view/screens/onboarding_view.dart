// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_app/data/data_source/static.dart';
import 'package:fitness_app/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentPage = 0;
  PageController? mycontroller;

  @override
  void initState() {
    mycontroller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    mycontroller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff353A40),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: mycontroller,
              itemCount: onBoardingList.length,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, i) {
                return SafeArea(
                  child: Column(
                    children: [
                      Image.asset(
                        onBoardingList[i].image!,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .7,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        onBoardingList[i].title!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 5),
                        duration: const Duration(milliseconds: 900),
                        width: currentPage == index ? 20 : 5,
                        height: 6,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (currentPage == onBoardingList.length - 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              }
              mycontroller!.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              width: 70,
              height: 80,
              decoration: const BoxDecoration(
                  color: Color(0xffFFA05C), shape: BoxShape.circle),
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}