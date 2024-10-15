import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class FrontdeltoidWorkout extends StatelessWidget {
  const FrontdeltoidWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Center(
          child: Text(
            'Front Deltoid',
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
            WorkoutOption(
              workout: 'Dumbell Shoulder Press',
              workoutUrl:
                  'https://youtube.com/shorts/OLePvpxQEGk?si=BxbfyQmuRywj5CvJ',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Dumbell Shoulder raises',
              workoutUrl:
                  'https://youtube.com/shorts/_6oXH8ZbB5M?si=iXPdnTYUMxOh0tJN',
            ),
          ],
        ),
      ),
    );
  }
}
