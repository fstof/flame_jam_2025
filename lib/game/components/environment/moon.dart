import 'package:flame_jam_2025/game/components/environment/planet.dart';
import 'package:flutter/material.dart';

class Moon extends Planet {
  Moon({
    required super.top,
    required super.maxLeft,
    required super.maxRight,
  }) : super(
          radius: sRadius,
          spritePath: 'Moon.png',
          glowColor: Colors.grey,
        );

  static const sRadius = 5.0;
}
