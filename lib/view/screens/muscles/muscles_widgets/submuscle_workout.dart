import 'package:flutter/material.dart';

class SubMuscleWorkouts extends StatelessWidget {
  const SubMuscleWorkouts({
    super.key,
    required this.subMuscleImage,
    required this.subMuscleName,
    required this.submusclePage,
  });
  final String subMuscleImage;
  final String subMuscleName;
  final Widget submusclePage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(subMuscleImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            subMuscleName,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => submusclePage),
      ),
    );
  }
}
