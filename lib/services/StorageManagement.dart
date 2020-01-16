import 'package:shared_preferences/shared_preferences.dart';

class StorageManagement {
  static void saveData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('weather-data', data);
  }

  static Future<String> readData() async {
    final prefs = await SharedPreferences.getInstance();
    String weatherData = prefs.getString('weather-data');
    print(weatherData);
    return weatherData;
  }

  static void deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('weather-data');
  }
}
