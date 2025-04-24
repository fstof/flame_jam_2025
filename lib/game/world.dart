import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_jam_2025/game/components/camera_target.dart';
import 'package:flame_jam_2025/game/components/environment/earth.dart';
import 'package:flame_jam_2025/game/components/environment/launchpad.dart';
import 'package:flame_jam_2025/game/components/environment/moon.dart';
import 'package:flame_jam_2025/game/components/environment/planet.dart';
import 'package:flame_jam_2025/game/components/environment/planet_sprites.dart';
import 'package:flame_jam_2025/game/components/player/player.dart';
import 'package:flame_jam_2025/game/game.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/util/util.dart';
import 'package:flutter/services.dart';

class SpaceWorld extends Forge2DWorld
    with TapCallbacks, KeyboardHandler, HasGameReference<MyGame> {
  final GameCubit cubit;
  Earth? earth;
  late Planet target;
  Planet? start;
  GameState? gameState;
  bool movingCamera = false;
  late final CameraTarget cameraTarget;

  StreamSubscription? _ss;

  SpaceWorld(this.cubit) {
    add(cameraTarget = CameraTarget());

    _ss = cubit.stream.listen((state) async {
      gameState = state;
      if (state is GameOverGameState) {
        game.pauseEngine();
      }
      if (state is LevelClearGameState) {
        final old = start;
        start = target;

        final height = game.camera.visibleWorldRect.height;
        final right = game.camera.visibleWorldRect.right;
        final left = game.camera.visibleWorldRect.left;
        final bottom = game.camera.visibleWorldRect.bottom;

        final distanceFromBottom = (start!.position.y - bottom).abs();

        final newBottom = bottom - (distanceFromBottom - start!.radius * 2);
        final newTop = newBottom - height;

        final newRadius = randomBetween(3, 9);

        target = Planet(
          top: newTop + newRadius * 2,
          maxLeft: left + newRadius * 2,
          maxRight: right - newRadius * 2,
          radius: newRadius,
          spritePath: planetNames[state.level % (planetNames.length)],
          glowColor: colors[state.level % (planetNames.length)],
        );

        await add(target);

        movingCamera = true;
        cameraTarget.go(
          to: cameraTarget.position.clone() -
              Vector2(0, (target.position.y - start!.position.y).abs()),
          duration: 1,
          onComplete: () {
            movingCamera = false;
            old?.removeFromParent();
          },
        );
      }
    });
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    gravity = Vector2(0, 0);

    final top = game.camera.visibleWorldRect.top;
    final right = game.camera.visibleWorldRect.right;
    final bottom = game.camera.visibleWorldRect.bottom;
    final left = game.camera.visibleWorldRect.left;

    await add(earth = Earth());
    await add(
      target = Moon(
        top: top + Moon.sRadius * 2,
        maxLeft: left + Moon.sRadius * 2,
        maxRight: right - Moon.sRadius * 2,
      ),
    );

    final playerPosition = Vector2(
      randomBetween(left + 4, right - 4),
      bottom - Earth.height * 1.8,
    );

    add(Launchpad(playerPosition));

    add(
      FlameBlocProvider<GameCubit, GameState>.value(
        value: cubit,
        children: [Player(playerPosition, this)],
      ),
    );
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (gameState is! LevelClearGameState) return false;

    if (movingCamera) return false;

    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.space) ||
          keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
          keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        cubit.start((gameState! as LevelClearGameState).level + 1);
      }
    }
    return false;
  }

  void cleanup() {
    _ss?.cancel();
  }
}
