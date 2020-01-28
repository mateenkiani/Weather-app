import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theming/theme_manager.dart';

Widget myDrawer(BuildContext context) {
  var theme = Provider.of<ThemeNotifier>(context);
  return Drawer(
    child: Container(
      color: theme.getTheme().primaryColor,
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () => theme.setLightMode(),
            child: ListTile(
              title: Text(
                "Light Mode",
                style: TextStyle(color: theme.getTheme().primaryTextColor),
              ),
              leading: Icon(
                Icons.local_florist,
                color: theme.getTheme().primaryTextColor,
              ),
            ),
          ),
          InkWell(
            onTap: () => theme.setDarkMode(),
            child: ListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(color: theme.getTheme().primaryTextColor),
              ),
              leading: Icon(
                Icons.lightbulb_outline,
                color: theme.getTheme().primaryTextColor,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
