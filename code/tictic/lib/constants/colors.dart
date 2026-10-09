import 'package:flutter/material.dart';

import 'fonts.dart';

const kMainColor = Color.fromRGBO(52, 78, 65, 1);
const kSecondaryColor = Color.fromRGBO(88, 129, 87, 1);
const kTertiaryColor = Color.fromRGBO(163, 177, 138, 1);
const kBackgroundColor = Color.fromRGBO(242, 239, 228, 1);
const kBackgroundColorCard = Colors.white;
const kErrorColor = Color.fromRGBO(238, 99, 82, 1);

final kShadow = BoxShadow(
  color: Colors.black.withValues(alpha: 0.1),
  spreadRadius: 2,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);

final appTheme = ThemeData(
  useMaterial3: true,
  // recommandé avec ColorScheme
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: kMainColor,
    // couleur principale (AppBar, boutons)
    onPrimary: Colors.white,
    // texte/icône sur primary
    secondary: kSecondaryColor,
    // accents (FAB, Switch, etc.)
    onSecondary: Colors.white,
    tertiary: kTertiaryColor,
    // couleur de soutien (cards, éléments secondaires)
    onTertiary: Colors.black,
    surfaceTint: kBackgroundColor,
    // fond général
    onSurfaceVariant: Colors.black87,
    // texte sur fond
    surface: Colors.white,
    // cartes, bottom sheets
    onSurface: Colors.black87,
    error: kErrorColor,
    onError: Colors.white,
  ),

  scaffoldBackgroundColor: kBackgroundColor,

  // assure cohérence
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16, color: kMainColor),
    bodyMedium: TextStyle(fontSize: 14, color: kMainColor),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: kMainColor,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: kButtonTextStyle,
      backgroundColor: kSecondaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kSecondaryColor,
    foregroundColor: Colors.white,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kTertiaryColor.withValues(alpha: 0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kTertiaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kSecondaryColor, width: 2),
    ),
  ),
);
