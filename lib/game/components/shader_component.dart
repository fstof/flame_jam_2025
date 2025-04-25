import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_jam_2025/game/gravity_game.dart'; // Imports PositionComponent, Component, etc.

class ShaderComponent extends PositionComponent
    with HasGameReference<GravityGame> {
  ShaderComponent({
    required this.shaderAsset,
    super.priority,
  });

  final String shaderAsset;
  late final FragmentShader shader;

  double time = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    anchor = Anchor.center;

    final fragmentProgram = await FragmentProgram.fromAsset(shaderAsset);
    shader = fragmentProgram.fragmentShader();
  }

  @override
  void update(double dt) {
    super.update(dt);
    time += dt;
  }
}
