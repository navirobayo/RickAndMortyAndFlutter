import 'package:flutter/material.dart';

class FlutterAtariTheme {
  FlutterAtariTheme._();

  // If you want to modify both themes at once, modify the colors below.

  static const Color _primaryColor = Color.fromARGB(255, 47, 239, 9);
  static const Color _primaryInverseColor = Color.fromARGB(255, 60, 69, 123);
  static const Color _onSurfaceColor = Color.fromARGB(255, 47, 239, 9);
  static const Color _onSurfaceVariant = Color.fromARGB(255, 233, 230, 137);
  static const Color _onPrimaryColor = Color.fromARGB(255, 255, 121, 3);
  static const Color _surfaceColor = Color.fromARGB(255, 60, 69, 123);
  static const Color _backgroundColor = Color(0xFF373C4B);
  static const Color _onSecondaryColor = Color(0xFFE1E3E4);
  static const Color _onBackgroundColor = Color(0xFF828A9A);
  static const Color _secondaryColor = Color.fromARGB(255, 233, 230, 137);
  static const Color _primaryContainer = Color(0xFF394634);
  static const Color _errorColor = Color(0xFFF69C5E);
  static const Color _onErrorColor = Color(0xFF354157);

  // If you want to modify the light theme only, modify the colors below.

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: FlutterAtariTheme._primaryColor,
      background: FlutterAtariTheme._backgroundColor,
      primary: FlutterAtariTheme._primaryColor,
      secondary: FlutterAtariTheme._secondaryColor,
      inversePrimary: FlutterAtariTheme._primaryInverseColor,
      onSurface: FlutterAtariTheme._onSurfaceColor,
      surface: FlutterAtariTheme._surfaceColor,
      onSurfaceVariant: FlutterAtariTheme._onSurfaceVariant,
      onPrimary: FlutterAtariTheme._onPrimaryColor,
      onSecondary: FlutterAtariTheme._onSecondaryColor,
      onBackground: FlutterAtariTheme._onBackgroundColor,
      primaryContainer: FlutterAtariTheme._primaryContainer,
      error: FlutterAtariTheme._errorColor,
      onError: FlutterAtariTheme._onErrorColor,
    ),
  );

  // If you want to modify the dark theme only, modify the colors below.

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: FlutterAtariTheme._primaryColor,
      background: FlutterAtariTheme._backgroundColor,
      primary: FlutterAtariTheme._primaryColor,
      secondary: FlutterAtariTheme._secondaryColor,
      inversePrimary: FlutterAtariTheme._primaryInverseColor,
      onSurface: FlutterAtariTheme._onSurfaceColor,
      surface: FlutterAtariTheme._surfaceColor,
      onSurfaceVariant: FlutterAtariTheme._onSurfaceVariant,
      onPrimary: FlutterAtariTheme._onPrimaryColor,
      onSecondary: FlutterAtariTheme._onSecondaryColor,
      onBackground: FlutterAtariTheme._onBackgroundColor,
      primaryContainer: FlutterAtariTheme._primaryContainer,
      error: FlutterAtariTheme._errorColor,
      onError: FlutterAtariTheme._onErrorColor,
    ),
  );
}

// A custom theme by @navirobayo | Check out FlutterCustomThemesVol1 for more. 
