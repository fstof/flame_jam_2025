import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_cubit.freezed.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameState.initial(hardMode: false));
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  void crash() {
    stopwatch.stop();
    final currentState = state;
    if (currentState is! PlayGameState) return;
    emit(
      GameState.gameOver(
        level: currentState.level,
        hardMode: state.hardMode,
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
        hardMode: state.hardMode,
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

  void toggleHardMode() {
    emit(GameState.initial(hardMode: !state.hardMode));
  }

  void reset() {
    stopwatch.reset();
    emit(GameState.initial(hardMode: state.hardMode));
  }

  void start([int level = 1]) {
    var fuel = 1.0;
    if (state is LevelClearGameState) {
      fuel = (state as LevelClearGameState).fuel;
    }
    stopwatch.start();
    emit(
      GameState.play(
        level: level,
        hardMode: state.hardMode,
        fuel: fuel,
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

  void boost({bool turning = false}) {
    final currentState = state;
    if (currentState is! PlayGameState) return;
    if (currentState.fuel <= 0) {
      emit(currentState.copyWith(fuel: 0));
    } else {
      if (turning) {
        if (currentState.hardMode) {
          emit(currentState.copyWith(fuel: currentState.fuel - 0.003));
        }
      } else {
        emit(currentState.copyWith(fuel: currentState.fuel - 0.003));
      }
    }
  }
}
