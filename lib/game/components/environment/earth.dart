import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class Earth extends BodyComponent {
  static Vector2 earthGravity = Vector2(0, 50);
  static const height = 5.0;
  static const gravityDistance = 20.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    renderBody = false;
  }

  @override
  Body createBody() {
    final screenWidth = game.camera.visibleWorldRect.width;
    final bottom = game.camera.visibleWorldRect.bottom;

    final shape = PolygonShape()
      ..setAsBoxXY(
        screenWidth * 0.5,
        height * 0.5,
      );

    final fixtureDef = FixtureDef(shape, friction: 1.0);
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(0, bottom - (height * 0.5)),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final earthPaint = Paint()..color = Colors.green;
    canvas.drawRect(
      Rect.fromCenter(
        center: position.toOffset(),
        width: game.camera.visibleWorldRect.width,
        height: game.camera.visibleWorldRect.height,
      ),
      earthPaint,
    );

    final skyRect = Rect.fromCenter(
      center: const Offset(0, -(height * 0.5 + gravityDistance * 0.5)),
      width: game.camera.visibleWorldRect.width,
      height: gravityDistance,
    );

    final skyPaint = Paint();
    skyPaint.shader = LinearGradient(
      colors: [
        Colors.blue.withValues(alpha: 0.8),
        Colors.transparent,
      ],
      end: Alignment.topCenter,
      begin: Alignment.center,
    ).createShader(skyRect);

    canvas.drawRect(skyRect, skyPaint);
  }
}
