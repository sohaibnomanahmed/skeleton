import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {

  Future<ThemeMode> getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? theme = prefs.getString('theme');

    if (theme == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else if (theme == ThemeMode.light.name) {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.name);
  }
}
