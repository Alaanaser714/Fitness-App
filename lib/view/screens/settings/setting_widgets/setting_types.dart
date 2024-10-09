import 'package:flutter/material.dart';

Widget getSettingType(
    {required IconData icon,
    required String text,
    Color? textColor,
    Color? iconColor}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFF3C3C3C),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor ?? const Color(0xFFF2994A)),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
