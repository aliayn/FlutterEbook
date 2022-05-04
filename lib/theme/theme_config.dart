import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _lightPrimary = Colors.white;
const Color _darkPrimary = Color(0xff1f1f1f);
const Color _lightAccent = Color(0xff2ca8e2);
const Color _darkAccent = Color(0xff2ca8e2);
const Color _lightBG = Colors.white;
const Color _darkBG = Color(0xff121212);

ThemeData lightTheme(context) => ThemeData(
    backgroundColor: _lightBG,
    primaryColor: _lightPrimary,
    scaffoldBackgroundColor: _lightBG,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
    textTheme: GoogleFonts.acmeTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: _darkPrimary, displayColor: _darkPrimary),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(brightness: Brightness.light, secondary: _lightAccent),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: _lightAccent));

ThemeData darkTheme(context) => ThemeData(
    brightness: Brightness.dark,
    backgroundColor: _darkBG,
    primaryColor: _darkPrimary,
    scaffoldBackgroundColor: _darkBG,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
    textTheme: GoogleFonts.acmeTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: _lightPrimary, displayColor: _lightPrimary),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(brightness: Brightness.dark, secondary: _darkAccent),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: _darkAccent));
