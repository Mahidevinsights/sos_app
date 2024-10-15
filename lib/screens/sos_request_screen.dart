import 'package:flutter/material.dart';

class SosRequestScreen extends StatefulWidget {
  const SosRequestScreen({super.key});

  @override
  State<SosRequestScreen> createState() => _SosRequestScreenState();
}

class _SosRequestScreenState extends State<SosRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'SOS Request screen',
        style: TextStyle(fontSize: 16),
      )),
    );
  }
}
