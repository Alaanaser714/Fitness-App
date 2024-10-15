import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class ChestWorkouts extends StatelessWidget {
  const ChestWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Chest',
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
              workout: 'Dumbell bench press',
              workoutUrl:
                  'https://youtube.com/shorts/1V3vpcaxRYQ?si=rBXjn1lRUoU49E1x',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Butterfly',
              workoutUrl:
                  'https://youtube.com/shorts/g3T7LsEeDWQ?si=Ywiw9vvxnmGJJgND',
            ),
          ],
        ),
      ),
    );
  }
}
