import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Theming {
  /* ------ CONSTANTS ----- */
  // colors - make tints at https://maketintsandshades.com
  final Color _primary = Colors.amber; // #6D67FF
  // static const Color _primaryLight = Color(0xFF8985FF);
  // static const Color _primaryDark = Color(0xFF5652CC);

  final Color _secondary = Colors.deepOrange; // #6D67FF
  // static const Color _secondaryLight = Color(0xFF8985FF);
  // static const Color _secondaryDark = Color(0xFF5652CC);

  final Color _bgColorDark = const Color(0xFF19182C);
  final Color _bgColorSuppDark = const Color(0xFF242339);
  //final Color _iconColorDark = const Color(0xFF363740);

  // static const Color _light = Color(0xFFF7F8FC);
  // static const Color _lightGray = Color(0xFFA4A6B3);
  // static const Color _darkGray = Color(0xFF363740);

  final double _defaultElevation = 0;

  /* ------ WIDGET THEMES -------- */
  final _textTheme = GoogleFonts.ralewayTextTheme;
  late AppBarTheme _appBarTheme;
  late ElevatedButtonThemeData _elevatedButtonThemeData;
  late FloatingActionButtonThemeData _floatingActionButtonThemeData;
  late InputDecorationTheme _inputDecorationTheme;
  late IconThemeData _iconThemeData;

  /* ------ APP THEMES --------- */
  late ThemeData _lightTheme;
  late ThemeData _darkTheme;

  // getters
  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  Theming() {
    _appBarTheme = AppBarTheme(
      elevation: _defaultElevation,
      backgroundColor: _secondary
    );

    _elevatedButtonThemeData = ElevatedButtonThemeData(
        style: TextButton.styleFrom(elevation: _defaultElevation));

    _floatingActionButtonThemeData = FloatingActionButtonThemeData(
      elevation: _defaultElevation,
      disabledElevation: _defaultElevation,
      highlightElevation: _defaultElevation,
    );

    _inputDecorationTheme = const InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      filled: true,
      isDense: true,
    );

    _iconThemeData = IconThemeData(color: _primary);

    _lightTheme = ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: _primary,
        secondary: _secondary,
      ),
      elevatedButtonTheme: _elevatedButtonThemeData,
      floatingActionButtonTheme: _floatingActionButtonThemeData,
      inputDecorationTheme: _inputDecorationTheme,
      textTheme: _textTheme(),
      appBarTheme: _appBarTheme,
      iconTheme: _iconThemeData,
    );

    _darkTheme = ThemeData.dark().copyWith(
      primaryColor: _primary,
      colorScheme: const ColorScheme.dark()
          .copyWith(primary: _primary, secondary: _secondary),
      elevatedButtonTheme: _elevatedButtonThemeData,
      floatingActionButtonTheme: _floatingActionButtonThemeData,
      inputDecorationTheme: _inputDecorationTheme,
      textTheme: _textTheme(ThemeData(brightness: Brightness.dark).textTheme),
      appBarTheme: _appBarTheme,
      iconTheme: _iconThemeData,
      scaffoldBackgroundColor: _bgColorDark,
      canvasColor: _bgColorSuppDark,
    );
  }
}