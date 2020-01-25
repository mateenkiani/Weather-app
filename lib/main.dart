import 'package:flutter/material.dart';
import './theming/theme_manager.dart';
import 'package:provider/provider.dart';
import './services/storage_manager.dart';
import './routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageManager.readData('themeMode').then((value) {
    var themeMode = value ?? 'light';
    return runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => new ThemeNotifier(themeMode),
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SofiaPro'),
      color: Colors.white,
      home: HomePage(),
    );
  }
}
