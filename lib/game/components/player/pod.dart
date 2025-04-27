import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Particle;
import 'package:flame_jam_2025/audio/audio_controller.dart';
import 'package:flame_jam_2025/audio/sounds.dart';
import 'package:flame_jam_2025/game/components/environment/earth.dart';
import 'package:flame_jam_2025/game/components/environment/launchpad.dart';
import 'package:flame_jam_2025/game/components/environment/planet.dart';
import 'package:flame_jam_2025/game/components/player/booster.dart';
import 'package:flame_jam_2025/game/components/player/player.dart';
import 'package:flame_jam_2025/game/space_world.dart';
import 'package:flame_jam_2025/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pod extends BodyComponent with KeyboardHandler, ContactCallbacks {
  static final Vector2 size = Vector2(2, 2);
  final Vector2 _position;
  int turning = 0;
  int turningStrength = 10;
  bool isBoosting = false;
  double boostStrength = 50;
  bool attached = true;
  double detachedTime = 0;
  final Player _player;

  AudioPlayer? nudge;
  AudioPlayer? boost;

  final Tween<double> noise = Tween(begin: -0.5, end: 0.5);
  final colorTween = ColorTween(begin: Colors.red, end: Colors.yellow);

  Pod(this._position, this._player);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    renderBody = false;
    priority = 999;

    final sprite = await game.loadSprite('Pod.png');
    add(
      SpriteComponent(
        sprite: sprite,
        size: Vector2(size.x, size.y),
        anchor: Anchor.center,
      ),
    );
  }

  @override
  Body createBody() {
    final shape = CircleShape(radius: size.x * 0.5);

    final fixtureDef = FixtureDef(shape, friction: 0.5);

    final bodyDef = BodyDef(
      type: BodyType.dynamic,
      userData: this,
      position: _position,
      angularDamping: 1,
    );
    final body = world.createBody(bodyDef);
    body.createFixture(fixtureDef);

    return body;
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (attached || game.paused) {
      boost?.stop();
      nudge?.stop();
      return true;
    }

    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.space) ||
          keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
          keysPressed.contains(LogicalKeyboardKey.keyW)) {
        isBoosting = true;
        if (boost?.source != null) {
          boost!.setReleaseMode(ReleaseMode.release);
          boost!.play(boost!.source!);
        } else {
          AudioController.instance
              .playSfx(SoundType.podBoost)
              .then((ap) => boost = ap);
        }
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
          keysPressed.contains(LogicalKeyboardKey.keyA)) {
        turning = -1;
        if (nudge?.source != null) {
          nudge!.setReleaseMode(ReleaseMode.loop);
          nudge!.play(nudge!.source!);
        } else {
          AudioController.instance
              .playSfx(SoundType.podNudge)
              .then((ap) => nudge = ap);
        }
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
          keysPressed.contains(LogicalKeyboardKey.keyD)) {
        turning = 1;
        if (nudge?.source != null) {
          nudge!.setReleaseMode(ReleaseMode.loop);
          nudge!.play(nudge!.source!);
        } else {
          AudioController.instance
              .playSfx(SoundType.podNudge)
              .then((ap) => nudge = ap);
        }
      }
    }
    if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space ||
          event.logicalKey == LogicalKeyboardKey.arrowUp ||
          event.logicalKey == LogicalKeyboardKey.keyW) {
        isBoosting = false;
        boost?.stop();
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
          event.logicalKey == LogicalKeyboardKey.keyA) {
        turning = 0;
        nudge?.stop();
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
          event.logicalKey == LogicalKeyboardKey.keyD) {
        turning = 0;
        nudge?.stop();
      }
    }
    return true;
  }

  @override
  void update(double dt) {
    _applyGravity();
    _checkBoundry();
    _player.updateSpeed(speed);

    if (attached) {
      return;
    } else {
      detachedTime += dt;
    }

    if (isBoosting && _player.fuelRemaining > 0) {
      _player.boost(dt);
      final x = math.cos(angle - (math.pi / 2)) * boostStrength;
      final y = math.sin(angle - (math.pi / 2)) * boostStrength;

      final force = Vector2(x, y);

      body.applyForce(force);
      add(
        ParticleSystemComponent(
          priority: -1,
          position: Vector2(0, size.y * 0.5),
          particle: Particle.generate(
            lifespan: 0.1,
            count: 15,
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
        ),
      );
    }
    if (turning != 0 && _player.fuelRemaining > 0) {
      _player.boost(dt, turning: true);
      body.applyTorque(size.y * turningStrength * turning);
    }
    super.update(dt);
  }

  double get speed {
    final v = body.linearVelocity;
    return math.sqrt((v.x * v.x) + (v.y * v.y));
  }

  @override
  void beginContact(Object other, Contact contact) {
    final target = (world as SpaceWorld).target;

    if (other == target) {
      if (speed > kLethalSpeed) {
        // _player.win();
        _player.crash();
      } else {
        _player.win();
      }
    } else if (other is Earth || other is Launchpad) {
      _player.crash();
    } else if (other is Booster && detachedTime > 0.5) {
      _player.crash();
    }
  }

  void _applyGravity() {
    final planets = world.children.query<Planet>();
    for (final p in planets) {
      final distanceToMoon = body.position.distanceTo(p.position) - p.radius;
      if (distanceToMoon < p.gravityDistance) {
        final myPos = body.position;
        final pPos = p.body.position;
        final differenceVector = pPos - myPos;
        var angleRadians = math.atan2(differenceVector.y, differenceVector.x);
        angleRadians = (angleRadians + (2 * math.pi)) % (2 * math.pi);
        final force = Vector2(
          math.cos(angleRadians) * p.gravity,
          math.sin(angleRadians) * p.gravity,
        );
        body.applyForce(force);
      }
    }
    final earth = (world as SpaceWorld).earth;
    if (earth != null) {
      final distanceToEarth =
          (earth.position.y - Earth.height * 0.5) - body.position.y;

      if (distanceToEarth < Earth.gravityDistance) {
        body.applyForce(Earth.earthGravity);
      }
    }
  }

  void _checkBoundry() {
    if (position.x < game.camera.visibleWorldRect.left - 5 ||
        position.x > game.camera.visibleWorldRect.right + 5 ||
        position.y < game.camera.visibleWorldRect.top - 5 ||
        position.y > game.camera.visibleWorldRect.bottom + 5) {
      _player.crash();
    }
  }

  void detach() {
    attached = false;
  }
}
