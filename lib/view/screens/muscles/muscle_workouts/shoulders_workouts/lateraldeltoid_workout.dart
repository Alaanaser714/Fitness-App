import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class LateraldeltoidWorkout extends StatelessWidget {
  const LateraldeltoidWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Center(
          child: Text(
            'Lateral Deltoid',
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
              workout: 'Lateral Raises',
              workoutUrl:
                  'https://youtube.com/shorts/JIhbYYA1Q90?si=NTr6kq9-CW-mLGc5',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Single Arm Lateral Cable Raises',
              workoutUrl:
                  'https://youtube.com/shorts/f_OGBg2KxgY?si=2nu_wK58YksfOdPU',
            ),
          ],
        ),
      ),
    );
  }
}
