// ignore_for_file: lines_longer_than_80_chars

import 'package:flame_jam_2025/gravity_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GravityApp());
}

class GravityApp extends StatelessWidget {
  const GravityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(body: GravityWidget()),
    );
  }
}
