import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_jam_2025/game/components/player/booster.dart';
import 'package:flame_jam_2025/game/components/player/pod.dart';
import 'package:flame_jam_2025/game/world.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';

class Player extends Component
    with KeyboardHandler, FlameBlocReader<GameCubit, GameState> {
  final Vector2 _position;
  late Booster booster;
  late Pod pod;
  final SpaceWorld world;
  double boostTime = 0;

  Player(this._position, this.world);

  @override
  Future<void> onLoad() {
    world.add(
      pod = Pod(
        _position - Vector2(0, (Booster.size.y * 0.5) + (Pod.size.y * 0.5)),
        this,
      ),
    );
    world.add(booster = Booster(_position, this));

    return super.onLoad();
  }

  double get fuelRemaining =>
      bloc.state is PlayGameState ? (bloc.state as PlayGameState).fuel : 0;

  void crash() {
    bloc.crash();
  }

  void win() {
    bloc.win();
  }

  void start() {
    bloc.start();
  }

  void updateSpeed(double speed) {
    bloc.updateSpeed(speed);
  }

  void boost(double dt) {
    boostTime += dt;
    if (boostTime > 0.1) {
      bloc.boost();
      boostTime = 0;
    }
  }
}
