import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flame_jam_2025/game/components/environment/starfield_background.dart';
import 'package:flame_jam_2025/game/space_world.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/util/util.dart';

class GravityGame extends Forge2DGame<SpaceWorld>
    with HasKeyboardHandlerComponents {
  GravityGame(this.cubit)
      : super(
          camera: CameraComponent.withFixedResolution(
            width: kCameraSize.x * 0.25,
            height: kCameraSize.y,
          ),
          world: SpaceWorld(cubit),
        );
  final GameCubit cubit;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.follow(world.cameraTarget);

    world.add(StarfieldBackgroundComponent());
  }

  void reset() {
    world.cleanup();
  }
}
