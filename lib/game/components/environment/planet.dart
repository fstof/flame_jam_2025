import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_jam_2025/game/components/environment/planet_sprites.dart';
import 'package:flame_jam_2025/util/util.dart';
import 'package:flutter/material.dart';

class Planet extends BodyComponent {
  Planet({
    required double top,
    required double maxLeft,
    required double maxRight,
    double? radius,
    double? gravity,
    double? gravityDistance,
    this.spritePath,
    this.glowColor,
  }) {
    _position = Vector2(randomBetween(maxLeft, maxRight), top);
    spritePath ??= planetNames[rng.nextInt(planetNames.length)];
    glowColor ??= randomColor();

    if (radius == null) {
      this.radius = randomBetween(3, 9);
    } else {
      this.radius = radius;
    }
    if (gravity == null) {
      this.gravity = this.radius * 3;
    } else {
      this.gravity = gravity;
    }
    if (gravityDistance == null) {
      this.gravityDistance = this.gravity / 2;
    } else {
      this.gravityDistance = gravityDistance;
    }
  }

  late final Vector2 _position;
  late double radius;
  late double gravity;
  late double gravityDistance;
  String? spritePath;
  Color? glowColor;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    if (spritePath != null) {
      renderBody = false;
      final sprite = await game.loadSprite(spritePath!);

      add(
        SpriteComponent(
          sprite: sprite,
          size: Vector2.all(radius * 2),
          anchor: Anchor.center,
          angle: rng.nextDouble() * 360,
        ),
      );
    }
  }

  @override
  Body createBody() {
    final shape = CircleShape(radius: radius);

    final fixtureDef = FixtureDef(shape, friction: 1);
    final bodyDef = BodyDef(
      userData: this,
      position: _position,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (glowColor != null) {
      const off = Offset.zero;

      final box = Rect.fromCenter(
        center: off,
        width: (gravityDistance + radius) * 2,
        height: (gravityDistance + radius) * 2,
      );

      final skyPaint = Paint();
      skyPaint.shader = RadialGradient(
        colors: [
          glowColor!.withValues(alpha: 0.8),
          glowColor!.withValues(alpha: 0.0),
        ],
      ).createShader(box);

      canvas.drawCircle(
        off,
        gravityDistance + radius,
        skyPaint,
      );
    }
  }
}
