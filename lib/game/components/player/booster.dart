import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Particle;
import 'package:flame_jam_2025/game/components/environment/earth.dart';
import 'package:flame_jam_2025/game/components/player/player.dart';
import 'package:flame_jam_2025/game/space_world.dart';
import 'package:flame_jam_2025/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Booster extends BodyComponent with KeyboardHandler {
  // static final Vector2 size = Vector2(3, 5);
  static final Vector2 size = Vector2(2, 4);
  final Vector2 _position;
  int turning = 0;
  // int turningStrength = 100;
  int turningStrength = 50;
  bool isBoosting = false;
  double boostStrength = 200;
  bool active = true;
  final Player _player;
  final Tween<double> noise = Tween(begin: -0.5, end: 0.5);
  final colorTween = ColorTween(begin: Colors.red, end: Colors.yellow);

  Booster(this._position, this._player);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    renderBody = false;

    final sprite = await game.loadSprite('Booster.png');
    add(
      SpriteComponent(
        sprite: sprite,
        size: size,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  Body createBody() {
    final shape = PolygonShape()..setAsBoxXY(size.x * 0.5, size.y * 0.5);

    final fixtureDef = FixtureDef(shape, friction: 0.7);

    final bodyDef = BodyDef(
      type: BodyType.dynamic,
      userData: this,
      position: _position,
    );
    final body = world.createBody(bodyDef);
    body.createFixture(fixtureDef);

    final weldJointDef = WeldJointDef()
      ..initialize(_player.pod.body, body, _position);
    world.createJoint(WeldJoint(weldJointDef));

    return body;
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (!active) return true;

    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.space) ||
          keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
          keysPressed.contains(LogicalKeyboardKey.keyW)) {
        isBoosting = true;
        _player.start();
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
          keysPressed.contains(LogicalKeyboardKey.keyA)) {
        turning = -1;
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
          keysPressed.contains(LogicalKeyboardKey.keyD)) {
        turning = 1;
      }
    }
    if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space ||
          event.logicalKey == LogicalKeyboardKey.arrowUp ||
          event.logicalKey == LogicalKeyboardKey.keyW) {
        isBoosting = false;
        detach();
        _player.pod.detach();
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
          event.logicalKey == LogicalKeyboardKey.keyA) {
        turning = 0;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
          event.logicalKey == LogicalKeyboardKey.keyD) {
        turning = 0;
      }
    }
    return true;
  }

  @override
  void update(double dt) {
    final earth = (world as SpaceWorld).earth;
    if (earth != null) {
      final distanceToEarth =
          (earth.position.y - Earth.height * 0.5) - body.position.y;

      if (distanceToEarth < Earth.gravityDistance) {
        body.applyForce(Earth.earthGravity);
      }
    }

    if (!active) return;

    if (isBoosting && _player.fuelRemaining > 0) {
      _player.boost(dt);

      final strength = size.y * 100;
      final y = math.sin(angle - (math.pi / 2)) * strength;
      final x = math.cos(angle - (math.pi / 2)) * strength;

      final force = Vector2(x, y);

      body.applyForce(force);
      add(
        ParticleSystemComponent(
          position: Vector2(0, size.y * 0.5),
          particle: Particle.generate(
            lifespan: 0.1,
            count: 20,
            generator: (i) {
              return AcceleratedParticle(
                lifespan: 0.25,
                speed: Vector2(
                      noise.transform(rng.nextDouble()),
                      1,
                    ) *
                    i.toDouble(),
                child: CircleParticle(
                  radius: 0.7,
                  paint: Paint()
                    ..color = colorTween.transform(rng.nextDouble())!,
                ),
              );
            },
          ),
        )..priority = -1,
      );
    }
    if (turning != 0 && _player.fuelRemaining > 0) {
      _player.boost(dt);
      body.applyTorque(size.y * turningStrength * turning);
    }
    super.update(dt);
  }

  void detach() {
    if (!active) return;
    active = false;
    world.destroyJoint(body.joints[0]);
  }
}
