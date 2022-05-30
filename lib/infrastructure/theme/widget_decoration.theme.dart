import 'package:flutter/material.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';

InputDecoration inputInputDecorationRounded = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    hintStyle: TextStyle(color: unselectedWidgetColor),
    fillColor: Colors.white70);

BoxDecoration inputBoxDecorationRounded = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(color: shadowColor, blurRadius: 4, offset: const Offset(0, 2))
    ]);
