import 'package:fitness_app/view/screens/muscles/muscle_workouts/arm_workouts/biceps_workout.dart';
import 'package:fitness_app/view/screens/muscles/muscle_workouts/arm_workouts/forearm_workout.dart';
import 'package:fitness_app/view/screens/muscles/muscle_workouts/arm_workouts/triceps_workout.dart';
import 'package:fitness_app/view/screens/muscles/muscles_widgets/submuscle_workout.dart';
import 'package:flutter/material.dart';

class ArmWorkouts extends StatelessWidget {
  const ArmWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Arm',
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
                  'assets/images/3-triceps-muscles-sebastian-kaulitzkiscience-photo-library.jpg',
              subMuscleName: 'Triceps',
              submusclePage: TricepsWorkout(),
            ),
            SizedBox(
              height: 10,
            ),
            SubMuscleWorkouts(
              subMuscleImage:
                  'assets/images/bicepes-muscle-pain-blue-background-600nw-2454790561.jpg',
              subMuscleName: 'Biceps',
              submusclePage: BicepsWorkout(),
            ),
            SizedBox(
              height: 10,
            ),
            SubMuscleWorkouts(
              subMuscleImage:
                  'assets/images/3d-illustration-human-forearms-muscle-260nw-1889459083.jpg',
              subMuscleName: 'Forearms',
              submusclePage: ForearmWorkout(),
            )
          ],
        ),
      ),
    );
  }
}
