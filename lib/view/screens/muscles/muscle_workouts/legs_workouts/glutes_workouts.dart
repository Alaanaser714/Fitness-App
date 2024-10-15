import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class GlutesWorkouts extends StatelessWidget {
  const GlutesWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Glutes',
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
              workout: 'Squats',
              workoutUrl:
                  'https://youtube.com/shorts/PPmvh7gBTi0?si=yQ70IfFLkEkk7r9L',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Hip Thrust',
              workoutUrl:
                  'https://youtube.com/shorts/W86oVlnLqY4?si=mmMC4NXvGwbLzqb-',
            ),
          ],
        ),
      ),
    );
  }
}
