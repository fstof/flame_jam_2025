import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart'; // For toSize()
import 'package:flame_jam_2025/game/components/shader_component.dart';

class StarfieldBackgroundComponent extends ShaderComponent {
  StarfieldBackgroundComponent({super.priority})
      : super(shaderAsset: 'shaders/starfield.frag') {
    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    shader.setFloatUniforms((setter) {
      setter.setVector(size);
      setter.setFloat(time);
      setter.setFloat(1);
    });

    // Manually create a Paint object and assign the shader
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size.toSize(), paint);
  }
}
