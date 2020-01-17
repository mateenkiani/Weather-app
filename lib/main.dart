import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.orange),
      child: Text(
        'Hello World',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 32,
          color: Colors.black87,
        ),
      ),
    );
  }
}
