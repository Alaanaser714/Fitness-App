import 'package:fitness_app/view/screens/muscles/muscle_workouts/shoulders_workouts/frontdeltoid_workout.dart';
import 'package:fitness_app/view/screens/muscles/muscle_workouts/shoulders_workouts/lateraldeltoid_workout.dart';
import 'package:fitness_app/view/screens/muscles/muscle_workouts/shoulders_workouts/reardeltoid_workout.dart';
import 'package:fitness_app/view/screens/muscles/muscles_widgets/submuscle_workout.dart';
import 'package:flutter/material.dart';

class ShouldersWorkouts extends StatelessWidget {
  const ShouldersWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Shoulders',
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
                  'assets/images/clavicular-part-deltoid-anatomy-medical-illustration-154957224_iconl_nowm.jpg',
              subMuscleName: 'Front Deltiod',
              submusclePage: FrontdeltoidWorkout(),
            ),
            SizedBox(
              height: 10,
            ),
            SubMuscleWorkouts(
              subMuscleImage:
                  'assets/images/istockphoto-1079432962-612x612.jpg',
              subMuscleName: 'lateral Deltoid',
              submusclePage: LateraldeltoidWorkout(),
            ),
            SizedBox(
              height: 10,
            ),
            SubMuscleWorkouts(
              subMuscleImage:
                  'assets/images/3d-rendered-medically-accurate-illustration-260nw-1268784040.jpg',
              subMuscleName: 'Rear Deltoid',
              submusclePage: ReardeltoidWorkout(),
            )
          ],
        ),
      ),
    );
  }
}
