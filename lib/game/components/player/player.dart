import 'package:flame/components.dart';
import 'package:flame_jam_2025/audio/audio_controller.dart';
import 'package:flame_jam_2025/audio/sounds.dart';
import 'package:flame_jam_2025/game/components/player/booster.dart';
import 'package:flame_jam_2025/game/components/player/keyboard_mapping.dart';
import 'package:flame_jam_2025/game/components/player/pod.dart';
import 'package:flame_jam_2025/game/space_world.dart';
import 'package:flame_jam_2025/state/2_player_game/game2_cubit.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';

class Player extends Component with KeyboardHandler {
  Player({
    required Vector2 position,
    required this.world,
    required this.gameCubit,
    required this.game2Cubit,
    this.player1 = true,
    this.multiplayer = false,
    this.keyboardMapping = defaultKBMapping,
  }) : _position = position;

  final GameCubit gameCubit;
  final Game2Cubit game2Cubit;
  final Vector2 _position;
  late Booster booster;
  late Pod pod;
  final SpaceWorld world;
  final bool player1;
  final bool multiplayer;
  double boostTime = 0;

  final KeyboardMapping keyboardMapping;

  @override
  Future<void> onLoad() async {
    world.add(
      pod = Pod(
        _position - Vector2(0, (Booster.size.y * 0.5) + (Pod.size.y * 0.5)),
        this,
      ),
    );
    world.add(booster = Booster(_position, this));

    return super.onLoad();
  }

  double get fuelRemaining => gameCubit.state is PlayGameState
      ? (gameCubit.state as PlayGameState).fuel
      : 0;

  void crash() {
    AudioController.instance.playSfx(SoundType.crash);
    gameCubit.crash();
  }

  void win() {
    AudioController.instance.playSfx(SoundType.landing);
    gameCubit.win();
  }

  void start() {
    gameCubit.start();
  }

  void updateSpeed(double speed) {
    gameCubit.updateSpeed(speed);
  }

  void boost(double dt, {bool turning = false}) {
    boostTime += dt;
    if (boostTime > 0.1) {
      gameCubit.boost(turning: turning);
      boostTime = 0;
    }
  }

  void boosterLanded() {
    gameCubit.boosterLanded();
  }
}
