import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class BicepsWorkout extends StatelessWidget {
  const BicepsWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Center(
          child: Text(
            'Biceps',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: const [
            SizedBox(
              height: 15,
            ),
            WorkoutOption(workout: 'Dumbell Rows'),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(workout: 'Dumbbell Concentration Curl'),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(workout: 'Dumbbell hammer Curl'),
          ],
        ),
      ),
    );
  }
}