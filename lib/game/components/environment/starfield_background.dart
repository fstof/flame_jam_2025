// ignore_for_file: lines_longer_than_80_chars

import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart'; // For toSize()
import 'package:flame_jam_2025/game/components/shader_component.dart';

class StarfieldBackgroundComponent extends ShaderComponent {
  StarfieldBackgroundComponent({super.priority, Vector2? size})
      : _size = size,
        super(shaderAsset: 'shaders/starfield.frag');
  final Vector2? _size;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    anchor = Anchor.center;
    size = _size ?? game.camera.viewport.size;
    position = game.camera.visibleWorldRect.center.toVector2() + (size / 2);
  }

  @override
  void render(Canvas canvas) {
    shader.setFloatUniforms((setter) {
      // uResolution: Canvas size in pixels
      setter.setVector(size);
      // uTime: Time for animation
      setter.setFloat(time);
      // uStarDensity: Density of stars (0.0 to 1.0, higher means more stars)
      setter.setFloat(1);
      // uStarSize: Base size of stars in pixels (e.g., 1.5)
      setter.setFloat(1.5);
      // uGridScale: Controls the spacing grid size (e.g., 50.0) - larger means denser potential star locations
      setter.setFloat(10);
      // uTwinkleIntensity: Controls the magnitude of brightness fluctuation (0.0 = none, 1.0 = standard)
      setter.setFloat(5);
    });

    // Manually create a Paint object and assign the shader
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size.toSize(), paint);
  }
}
