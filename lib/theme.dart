import 'package:flutter/material.dart';

// Couleurs Material
final Color primaryColor = Colors.pink;
final Color secondaryColor = Colors.deepPurple;

// Couleurs Mockup 
// final Color primaryColor = Color(0xFFE01B84);
// final Color primaryColor = Color(0xFF6D64E8);

ThemeData darkTheme = new ThemeData(
  accentColor: primaryColor,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);