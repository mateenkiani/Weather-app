import 'package:flutter/material.dart';
import './widgets/search_widget.dart';
import 'widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Search(),
      drawer: myDrawer(context),
    );
  }
}
