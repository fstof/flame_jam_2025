import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flame_jam_2025/game/components/environment/starfield_background.dart';
import 'package:flame_jam_2025/game/space_world.dart';
import 'package:flame_jam_2025/state/2_player_game/game2_cubit.dart';
import 'package:flame_jam_2025/state/audio_cubit.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/util/assets.dart';
import 'package:flame_jam_2025/util/util.dart';

class GravityGame extends Forge2DGame<SpaceWorld>
    with HasKeyboardHandlerComponents {
  GravityGame({
    required this.gameCubit,
    required this.game2Cubit,
    required this.audioCubit,
    this.players = 1,
  }) : super(
          camera: CameraComponent.withFixedResolution(
            width: kCameraSize.x,
            height: kCameraSize.y,
          ),
          world: SpaceWorld(
            gameCubit: gameCubit,
            game2Cubit: game2Cubit,
            players: players,
          ),
        );

  final int players;
  final GameCubit gameCubit;
  final Game2Cubit game2Cubit;
  final AudioCubit audioCubit;
  final audioPool = <String, AudioPool>{};

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    camera.follow(world.cameraTarget);
    camera.backdrop = StarfieldBackgroundComponent();

    await _loadAudio();
    await _loadImages();
  }

  Future<void> _loadAudio() async {
    await FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      bgmPath,
      sfxLanding,
      sfxCrash1,
      sfxCrash2,
      sfxCrash3,
      sfxPodBoost,
      sfxPodNudge,
      sfxLanding,
      sfxClick1,
      sfxClick2,
      sfxClick3,
    ]);
  }

  Future<void> _loadImages() async {
    await Flame.images.loadAll([
      imgBooster,
      imgLaunchpad,
      imgMoon,
      imgP1,
      imgP2,
      imgP3,
      imgP4,
      imgP5,
      imgP6,
      imgP7,
      imgP8,
      imgPod,
    ]);
  }

  void reset() {
    world.cleanup();
  }
}
