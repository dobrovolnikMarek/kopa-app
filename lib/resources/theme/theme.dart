import 'package:flutter/material.dart';

class Themes {
  // static final _darkColorScheme = ColorScheme.fromSwatch().copyWith(
  //   secondary: const Color.fromRGBO(245, 166, 49, 0.8),
  //   primary: const Color.fromRGBO(255, 188, 69, 1),
  //   background: const Color.fromRGBO(0, 0, 0, 1),
  // );

  static final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color.fromRGBO(54, 54, 54, 1),
    splashColor: const Color.fromRGBO(245, 166, 49, 0.2),
    highlightColor: Colors.transparent,
    focusColor: Colors.white70,
    // colorScheme: _darkColorScheme,
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'Arial',
      bodyColor: const Color.fromRGBO(255, 255, 255, 1),
    ),
 /*   inputDecorationTheme: InputDecorationTheme(
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromRGBO(40, 38, 36, 1),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      hintStyle: const TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.4),
        fontSize: 16.0,
      ),
      errorStyle: const TextStyle(
        color: Color.fromRGBO(255, 0, 0, 1.0),
        overflow: TextOverflow.ellipsis,
      ),
      labelStyle: const TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1.0),
        fontSize: 16.0,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
          color: _darkColorScheme.secondary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Colors.red[400]!,
          style: BorderStyle.solid,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.red,
          style: BorderStyle.solid,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          width: 1,
          style: BorderStyle.solid,
          color: Color.fromRGBO(185, 184, 183, 0.5),
        ),
      ),
      // constraints: const BoxConstraints(maxHeight: 50),
    ),*/
/*    textSelectionTheme: TextSelectionThemeData(
      cursorColor: _lightColorScheme.primary,
      selectionColor: _lightColorScheme.secondary,
      selectionHandleColor: _lightColorScheme.primary,
    ),*/
    // primaryColorLight: const Color.fromRGBO(246, 161, 74, 0.2),
  );
}
