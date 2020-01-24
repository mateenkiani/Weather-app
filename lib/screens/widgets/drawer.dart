  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theming/theme_manager.dart';

Widget myDrawer(BuildContext context) {
    var theme = Provider.of<ThemeNotifier>(context);
    return Drawer(
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
    );
  }