import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_jam_2025/game/game.dart';
import 'package:flutter/animation.dart';

class CameraTarget extends PositionComponent with HasGameReference<MyGame> {
  final effectController = CurvedEffectController(
    0.1,
    Curves.easeOut,
  )..setToEnd();

  late final MoveCameraTarget moveEffect;

  @override
  Future<void> onLoad() async {
    moveEffect = MoveCameraTarget(position, effectController);
    await add(moveEffect);
  }

  void go({
    required Vector2 to,
    double duration = 0.25,
    double scale = 1,
    void Function()? onComplete,
  }) {
    effectController.duration = duration * scale;
    moveEffect.onComplete = () {
      onComplete?.call();
      moveEffect.onComplete = null;
    };
    moveEffect.go(to: to);
  }
}

class MoveCameraTarget extends Effect with EffectTarget<CameraTarget> {
  MoveCameraTarget(this._to, super.controller);
  Vector2 _to;
  late Vector2 _from;

  @override
  void onMount() {
    super.onMount();
    _from = target.position;
  }

  @override
  bool get removeOnFinish => false;

  @override
  void apply(double progress) {
    target.position = Vector2(
      _from.x + (_to.x - _from.x) * progress,
      _from.y + (_to.y - _from.y) * progress,
    );
  }

  void go({required Vector2 to}) {
    reset();
    _from = target.position.clone();
    _to = to;
  }
}
