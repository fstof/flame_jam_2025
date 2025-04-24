import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_cubit.freezed.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameState.initial());
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  void crash() {
    stopwatch.stop();
    final currentState = state;
    if (currentState is! PlayGameState) return;
    emit(
      GameState.gameOver(
        level: currentState.level,
        fuel: currentState.fuel,
        crashSpeed: currentState.speed,
        time: currentState.time,
      ),
    );
  }

  void win() {
    stopwatch.stop();
    final currentState = state;
    if (currentState is! PlayGameState) return;
    emit(
      GameState.levelClear(
        level: currentState.level,
        fuel: currentState.fuel,
        time: currentState.time,
      ),
    );
    // start(currentLevel + 1);
    // emit(
    //   GameState.gameOver(
    //     win: true,
    //     fuel: currentState.fuel,
    //     time: currentState.time,
    //   ),
    // );
  }

  void reset() {
    stopwatch.reset();
    emit(const GameState.initial());
  }

  void start([int level = 1]) {
    stopwatch.start();
    emit(
      GameState.play(
        level: level,
        fuel: 1,
        time: stopwatch.elapsed,
        speed: 0,
      ),
    );
    timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      final currentState = state;
      if (currentState is! PlayGameState) return;
      emit(
        currentState.copyWith(
          time: stopwatch.elapsed,
        ),
      );
    });
  }

  void updateSpeed(double speed) {
    final currentState = state;
    if (currentState is! PlayGameState) return;
    emit(
      currentState.copyWith(
        speed: speed,
      ),
    );
  }

  void boost() {
    final currentState = state;
    if (currentState is! PlayGameState) return;
    if (currentState.fuel <= 0) {
      emit(currentState.copyWith(fuel: 0));
    } else {
      emit(currentState.copyWith(fuel: currentState.fuel - 0.01));
    }
  }
}
