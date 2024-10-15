// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_app/core/data/data_source/home_data.dart';
import 'package:flutter/material.dart';
import '../../../core/services/authentication/auth_service.dart';
import '../muscles/muscle_workouts/arm_workouts/arm_workouts.dart';
import '../muscles/muscle_workouts/back_workout.dart';
import '../muscles/muscle_workouts/chest_workouts.dart';
import '../muscles/muscle_workouts/legs_workouts/legs_workouts.dart';
import '../muscles/muscle_workouts/shoulders_workouts/shoulders_workout.dart';
import '../settings/setting_options/setting_options.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingOptions(),
                    ));
              },
              icon: const Icon(
                Icons.settings,
                size: 35,
                color: Colors.orange,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: homeList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChestWorkouts(),
                      ));
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BackWorkout(),
                      ));
                } else if (index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArmWorkouts(),
                      ));
                } else if (index == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShouldersWorkouts(),
                      ));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LegsWorkouts(),
                      ));
                }
              },
              child: Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          homeList[index].image!,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    homeList[index].title!,
                    style: TextStyle(
                      fontSize: 40,
                      color: const Color.fromARGB(255, 25, 3, 3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
