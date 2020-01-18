import 'package:flutter/material.dart';
import './Theming/ThemeManager.dart';
import 'package:provider/provider.dart';
import './services/StorageManager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageManager.readData('themeMode').then((value) {
    var themeMode = value ?? 'light';
    return runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => new ThemeNotifier(themeMode),
        lazy: false,
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (_, theme, __) => WidgetsApp(
        color: theme.getTheme().backgroundColor,
        builder: (context, int) {
          return Container(
              color: theme.getTheme().backgroundColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: theme.getTheme().secondaryHeaderColor,
                      child: Text(
                        'set Dark',
                        textDirection: TextDirection.ltr,
                      ),
                      onPressed: () => theme.setDarkMode(),
                    ),
                    RaisedButton(
                      color: Colors.blueGrey,
                      child: Text(
                        'set Light',
                        textDirection: TextDirection.ltr,
                      ),
                      onPressed: () => theme.setLightMode(),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
