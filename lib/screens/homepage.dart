import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theming/theme_manager.dart';
import './widgets/app_bar.dart';
import 'widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: MyAppBar(),
      backgroundColor: theme.getTheme().primaryColor,
      drawer: myDrawer(context),
    );
  }
}
