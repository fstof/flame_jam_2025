import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

final rng = Random();
final kCameraSize = Vector2(1024, 768);

double randomBetween(double min, double max) {
  return min + rng.nextDouble() * (max - min);
}

final colors = [
  Colors.grey,
  Colors.deepOrange,
  Colors.green,
  Colors.pink,
  Colors.blue,
  Colors.red,
  Colors.teal,
  Colors.yellow,
  Colors.purple,
];

Color randomColor() {
  return colors[rng.nextInt(colors.length)];
}
