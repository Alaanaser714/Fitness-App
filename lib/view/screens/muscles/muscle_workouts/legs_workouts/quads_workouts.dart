import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class QuadsWorkout extends StatelessWidget {
  const QuadsWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Quads',
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
              workout: 'Leg Extension',
              workoutUrl:
                  'https://youtube.com/shorts/ztNBgrGy6FQ?si=B23Zgk13mH0HvRNr',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Leg Press',
              workoutUrl:
                  'https://youtube.com/shorts/nDh_BlnLCGc?si=lyEEqCm4_bNU7fRi',
            ),
          ],
        ),
      ),
    );
  }
}
