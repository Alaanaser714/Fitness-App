import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class HamstringWorkout extends StatelessWidget {
  const HamstringWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Hamstring',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: const [
            SizedBox(
              height: 15,
            ),
            WorkoutOption(
              workout: 'Leg Curl',
              workoutUrl:
                  'https://youtube.com/shorts/ANKSmhT0dTk?si=1Q3_BW4Ke5eAHj_E',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Romanian Deadlift',
              workoutUrl:
                  'https://youtube.com/shorts/5rIqP63yWFg?si=CzlUSGpQFx9EmtQ6',
            ),
          ],
        ),
      ),
    );
  }
}
