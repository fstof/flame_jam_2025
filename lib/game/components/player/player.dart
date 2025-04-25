import 'package:flame/components.dart';
import 'package:flame_jam_2025/game/components/player/booster.dart';
import 'package:flame_jam_2025/game/components/player/pod.dart';
import 'package:flame_jam_2025/game/space_world.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';

class Player extends Component with KeyboardHandler {
  Player(this._position, this.world, this.cubit);

  final GameCubit cubit;
  final Vector2 _position;
  late Booster booster;
  late Pod pod;
  final SpaceWorld world;
  double boostTime = 0;

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

  double get fuelRemaining =>
      cubit.state is PlayGameState ? (cubit.state as PlayGameState).fuel : 0;

  void crash() {
    cubit.crash();
  }

  void win() {
    cubit.win();
  }

  void start() {
    cubit.start();
  }

  void updateSpeed(double speed) {
    cubit.updateSpeed(speed);
  }

  void boost(double dt, {bool turning = false}) {
    boostTime += dt;
    if (boostTime > 0.1) {
      cubit.boost(turning: turning);
      boostTime = 0;
    }
  }
}
