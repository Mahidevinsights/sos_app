import 'package:flutter/material.dart';
import 'package:sos_app/screens/home_screen.dart';

void main() {
  runApp(SosApp());
}

class SosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
