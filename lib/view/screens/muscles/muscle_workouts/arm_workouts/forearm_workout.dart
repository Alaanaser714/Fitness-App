import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class ForearmWorkout extends StatelessWidget {
  const ForearmWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Forearm',
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
              workout: 'Bar Wrist Curls',
              workoutUrl:
                  'https://youtube.com/shorts/n-n8rrOM1RU?si=j0-FKyYAzAIIly_S',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Arm Reverse Wrist Curl',
              workoutUrl:
                  'https://youtube.com/shorts/NcDp9dkWr7g?si=jmaGxne50slavc0H',
            ),
          ],
        ),
      ),
    );
  }
}
