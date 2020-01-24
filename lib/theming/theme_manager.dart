import 'package:flutter/material.dart';
import '../services/storage_manager.dart';

class MyTheme {
  ThemeData materialTheme;
  Color primary;
  Color secondary;

  MyTheme(String themeMode)
  {
    if (themeMode == 'light'){
      this.materialTheme = lightTheme;
      this.primary = Colors.white;
      this.secondary = Colors.grey;
    } else {
      this.materialTheme = darkTheme;
      this.primary = Colors.grey;
      this.secondary = Colors.black;
    }
  }

  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
}

class ThemeNotifier with ChangeNotifier {
  final lightTheme = MyTheme('light');
  final darkTheme = MyTheme('dark');

  MyTheme _themeData; 
  MyTheme getTheme() => _themeData;

  ThemeNotifier(String themeMode) {
    if (themeMode == 'light') {
      _themeData = lightTheme;
    } else {
      _themeData = darkTheme;
    }
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
