// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_info.dart';
import 'package:fitness_app/view/screens/muscles/muscles_widgets/workout_video_page.dart';
import 'package:flutter/material.dart';

class WorkoutOption extends StatelessWidget {
  const WorkoutOption({
    super.key,
    required this.workout,
    required this.workoutUrl,
  });
  final String workout;
  final String workoutUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(121, 125, 61, 0),
            Color.fromARGB(255, 10, 6, 0),
            Color.fromARGB(255, 10, 6, 0),
            Color.fromARGB(255, 10, 6, 0),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              workout,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WorkoutInfo(label: 'Duration:', value: '10 min'),
                WorkoutInfo(label: 'Reps:', value: '12'),
                WorkoutInfo(label: 'Sets:', value: '4'),
                WorkoutInfo(label: 'Exercise:', value: '5'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => workoutVideoPlayer(
                      workoutVideoUrl: workoutUrl,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Start workout',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
