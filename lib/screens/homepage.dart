import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theming/theme_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: Container(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            InkWell(
              onTap: () => theme.setLightMode(),
              child: ListTile(
                title: Text("Light Mode"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            InkWell(
              onTap: () => theme.setDarkMode(),
              child: ListTile(
                title: Text("Dark Mode"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
