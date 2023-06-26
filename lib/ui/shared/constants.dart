import 'package:flutter/material.dart';

class AppColors {
  //LETTER
  static const Color blue = Colors.blueAccent;
  static const Color white = Colors.white;
  static const Color orange = Color.fromRGBO(232, 164, 129, 1);

  //BACKGROUND
  static const Color beige = Color.fromRGBO(236, 221, 208, 1);
  static const Color green = Color.fromRGBO(206, 210, 194, 1);
}

InputDecoration fieldDecor = InputDecoration(
  filled: true,
  fillColor: Colors.blueAccent.withOpacity(0.1),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide.none,
  ),
);
