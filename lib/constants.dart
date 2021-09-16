import 'package:flutter/material.dart';

//LETTER
const Color BLUE = Colors.blueAccent;
const Color WHITE = Colors.white;
const Color ORANGE = Color.fromRGBO(232, 164, 129, 1);
//BACKGROUND
const Color BEIGE = Color.fromRGBO(236, 221, 208, 1);
const Color GREEN = Color.fromRGBO(206, 210, 194, 1);

InputDecoration fieldDecor = InputDecoration(
  filled: true,
  fillColor: Colors.blueAccent.withOpacity(0.1),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide.none,
  ),
);
