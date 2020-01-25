import 'package:flutter/material.dart';
import '../services/storage_manager.dart';

class MyTheme {
  Color primaryColor;
  Color secondaryColor;
  Color primaryTextColor;
  Color secondaryTextColor;

  MyTheme(String themeMode) {
    if (themeMode == 'light') {
      this.primaryColor = Color.fromRGBO(241, 251, 255, 1.0);
      this.primaryTextColor = Color.fromRGBO(30, 0, 62, 1.0);
      this.secondaryTextColor = Color.fromRGBO(30, 0, 62, 5.0);
      this.secondaryColor = Colors.grey;
    } else {
      this.primaryColor = Color.fromRGBO(30, 0, 62, 1.0);
      this.primaryTextColor = Color.fromRGBO(241, 251, 255, 1.0);
      this.secondaryTextColor = Color.fromRGBO(241, 251, 255, 5.0);
      this.secondaryColor = Colors.black;
    }
  }
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
