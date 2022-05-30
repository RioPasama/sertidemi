import 'package:flutter/material.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'colors.theme.dart';

ThemeData themeData() {
  return ThemeData(
      primaryColor: primaryColor,
      focusColor: primaryColor,
      indicatorColor: primaryColor,
      unselectedWidgetColor: unselectedWidgetColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      shadowColor: shadowColor,
      textTheme: textTheme,
      dialogBackgroundColor:
          const Color.fromARGB(255, 214, 234, 253).withOpacity(0.8),
      appBarTheme: AppBarTheme(
          color: primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(18)))),
      dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
              textStyle: MaterialStateProperty.all(const TextStyle(
                  color: Color.fromARGB(255, 163, 162, 162),
                  fontWeight: FontWeight.bold,
                  fontSize: 16)))),
      inputDecorationTheme:
          const InputDecorationTheme(hintStyle: TextStyle(fontSize: 14)));
}
