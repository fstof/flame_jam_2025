import 'dart:ui';

import 'package:flame/components.dart'; // Imports PositionComponent, Component, etc.

class ShaderComponent extends PositionComponent with HasGameReference {
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
    final fragmentProgram = await FragmentProgram.fromAsset(shaderAsset);
    shader = fragmentProgram.fragmentShader();
    size = game.camera.viewport.size;
  }

  // @override
  // void onGameResize(Vector2 size) {
  //   this.size = size;
  //   super.onGameResize(size);
  // }

  @override
  void update(double dt) {
    super.update(dt);
    time += dt;
  }
}
