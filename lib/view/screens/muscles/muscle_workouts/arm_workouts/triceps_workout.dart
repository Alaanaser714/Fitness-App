import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class TricepsWorkout extends StatelessWidget {
  const TricepsWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Triceps',
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
              workout: 'Rope Pushdown',
              workoutUrl:
                  'https://youtube.com/shorts/rBz89XjsE24?si=JpUgheJGt_VoenAs',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Skull Crucher',
              workoutUrl:
                  'https://youtube.com/shorts/zR9gty7LUxE?si=Xc8PRDGvs3Du1Qo3',
            ),
          ],
        ),
      ),
    );
  }
}
