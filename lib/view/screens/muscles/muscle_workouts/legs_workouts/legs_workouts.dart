import 'package:fitness_app/view/screens/muscles/muscle_workouts/legs_workouts/calves_workouts.dart';
import 'package:fitness_app/view/screens/muscles/muscle_workouts/legs_workouts/glutes_workouts.dart';
import 'package:fitness_app/view/screens/muscles/muscle_workouts/legs_workouts/hamstring_workouts.dart';
import 'package:fitness_app/view/screens/muscles/muscle_workouts/legs_workouts/quads_workouts.dart';
import 'package:fitness_app/view/screens/muscles/muscles_widgets/submuscle_workout.dart';
import 'package:flutter/material.dart';

class LegsWorkouts extends StatelessWidget {
  const LegsWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Legs',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: const [
            SizedBox(height: 15),
            SubMuscleWorkouts(
              subMuscleImage:
                  'assets/images/quadriceps-muscles-pain-blue-background-260nw-2455908199.jpg',
              subMuscleName: 'Quads',
              submusclePage: QuadsWorkout(),
            ),
            SizedBox(
              height: 10,
            ),
            SubMuscleWorkouts(
              subMuscleImage:
                  'assets/images/hamstring-muscle-pain-blue-background-260nw-2454790577.jpg',
              subMuscleName: 'Hamsting',
              submusclePage: HamstringWorkout(),
            ),
            SizedBox(
              height: 10,
            ),
            SubMuscleWorkouts(
              subMuscleImage: 'assets/images/istockphoto-498528869-612x612.jpg',
              subMuscleName: 'Glutes',
              submusclePage: GlutesWorkouts(),
            ),
            SizedBox(
              height: 10,
            ),
            SubMuscleWorkouts(
              subMuscleImage:
                  'assets/images/depositphotos_47045373-stock-photo-calves-female-anatomy-muscles.jpg',
              subMuscleName: 'Calves',
              submusclePage: CalvesWorkout(),
            )
          ],
        ),
      ),
    );
  }
}
