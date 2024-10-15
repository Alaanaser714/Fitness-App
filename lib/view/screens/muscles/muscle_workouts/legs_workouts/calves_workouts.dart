import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class CalvesWorkout extends StatelessWidget {
  const CalvesWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Calves',
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
              workout: 'Calves Raises',
              workoutUrl:
                  'https://youtube.com/shorts/9NXf0SzOZeY?si=MncR_jzduHGIvc-X',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Seated Calves Raises',
              workoutUrl:
                  'https://youtube.com/shorts/vCOlZ-zk80o?si=R_0ynsyAzSUb0n18',
            ),
          ],
        ),
      ),
    );
  }
}
