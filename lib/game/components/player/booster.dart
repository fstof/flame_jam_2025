import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Particle;
import 'package:flame_jam_2025/audio/audio_controller.dart';
import 'package:flame_jam_2025/audio/sounds.dart';
import 'package:flame_jam_2025/game/components/environment/earth.dart';
import 'package:flame_jam_2025/game/components/environment/launchpad.dart';
import 'package:flame_jam_2025/game/components/player/player.dart';
import 'package:flame_jam_2025/game/components/player/pod.dart';
import 'package:flame_jam_2025/game/space_world.dart';
import 'package:flame_jam_2025/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Booster extends BodyComponent with KeyboardHandler, ContactCallbacks {
  // static final Vector2 size = Vector2(3, 5);
  static final Vector2 size = Vector2(2, 4);
  final Vector2 _position;
  int turning = 0;
  // int turningStrength = 100;
  int turningStrength = 50;
  bool isBoosting = false;
  double boostStrength = 200;
  bool active = true;
  bool attached = true;
  final Player _player;
  final Tween<double> noise = Tween(begin: -0.5, end: 0.5);
  final colorTween = ColorTween(begin: Colors.red, end: Colors.yellow);
  AudioPlayer? boost;
  bool touchingPod = false;
  bool touchingEarth = false;

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
      if (_player.keyboardMapping.isBoostKey(keysPressed)) {
        isBoosting = true;
        _player.start();
        if (boost?.source != null) {
          boost!.setReleaseMode(ReleaseMode.release);
          boost!.play(boost!.source!);
        } else {
          AudioController.instance
              .playSfx(SoundType.launch)
              .then((ap) => boost = ap);
        }
      }

      if (_player.keyboardMapping.isLeftKey(keysPressed)) {
        turning = -1;
      }
      if (_player.keyboardMapping.isRightKey(keysPressed)) {
        turning = 1;
      }
    }

    if (event is KeyUpEvent) {
      if (_player.keyboardMapping.isBoostKey({event.logicalKey})) {
        isBoosting = false;
        boost?.stop();
        detach();
        _player.pod.detach();
      }
      if (_player.keyboardMapping.isLeftKey({event.logicalKey})) {
        turning = 0;
      }
      if (_player.keyboardMapping.isRightKey({event.logicalKey})) {
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
      _player.boost(dt, turning: true);
      body.applyTorque(size.y * turningStrength * turning);
    }
    super.update(dt);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (attached) return;

    if (other is Pod) {
      touchingPod = true;
    }
    if (other is Launchpad) {
      touchingEarth = true;

      _player.boosterLanded();
      print('BOOSTER LANDED');
    }

    if (touchingEarth && touchingPod) {
      _player.crash();
    }
  }

  @override
  void endContact(Object other, Contact contact) {
    if (other is Pod) {
      touchingPod = false;
    }
    if (other is Launchpad) {
      touchingEarth = false;
    }
  }

  void detach() {
    if (!active) return;
    active = false;
    attached = false;
    world.destroyJoint(body.joints[0]);
  }
}
