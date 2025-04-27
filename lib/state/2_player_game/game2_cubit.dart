import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flame_jam_2025/storage/storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game2_cubit.freezed.dart';
part 'game2_state.dart';

const int POINTS_PER_LEVEL = 1000;
const int LEVEL_COMPLETION_BONUS_SCALAR = 100;
const int POINTS_PER_SECOND = 2;
const int BOOSTER_LANDING_BONUS = 1500;
const double HARD_DIFFICULTY_MULTIPLIER = 1.75;
const double NORMAL_DIFFICULTY_MULTIPLIER = 1.0;

class Game2Cubit extends Cubit<Game2State> {
  Game2Cubit()
      : super(
          const Game2State.initial(
            p1Time: Duration.zero,
            p2Time: Duration.zero,
          ),
        );
  Storage storage = Storage.instance;
  Stopwatch p1stopwatch = Stopwatch();
  Stopwatch p2stopwatch = Stopwatch();
  Timer? timer;

  void loadGame() {
    emit(
      Game2State.initial(
        p1Time: Duration(milliseconds: storage.mpGetScore(true)),
        p2Time: Duration(milliseconds: storage.mpGetScore(false)),
      ),
    );
  }

  void crash(bool player1) {
    final currentState = state;
    if (currentState is! PlayGame2State) return;

    if (player1) p1stopwatch.stop();
    if (!player1) p2stopwatch.stop();

    final newState = currentState.copyWith(
      p1Crashed: player1,
      p2Crashed: !player1,
    );

    if (newState.p1Crashed && newState.p2Crashed) {
      emit(
        Game2State.gameOver(
          p1Time: p1stopwatch.elapsed,
          p2Time: p2stopwatch.elapsed,
          p1Fuel: currentState.p1Fuel,
          p2Fuel: currentState.p2Fuel,
          p1crashSpeed: currentState.p1Speed,
          p2crashSpeed: currentState.p2Speed,
        ),
      );
    } else {
      emit(
        currentState.copyWith(
          p1Crashed: player1,
          p2Crashed: !player1,
          p1Time: p1stopwatch.elapsed,
          p2Time: p2stopwatch.elapsed,
        ),
      );
    }
  }

  void win(bool player1) {
    final currentState = state;
    if (currentState is! PlayGame2State) return;

    if (player1) p1stopwatch.stop();
    if (!player1) p2stopwatch.stop();

    final newState = currentState.copyWith(
      p1Landed: player1,
      p2Landed: !player1,
    );

    if (newState.p1Landed && newState.p2Landed) {
      emit(
        Game2State.levelClear(
          p1Time: p1stopwatch.elapsed,
          p2Time: p2stopwatch.elapsed,
          p1Fuel: currentState.p1Fuel,
          p2Fuel: currentState.p2Fuel,
        ),
      );
    } else {
      emit(
        currentState.copyWith(
          p1Crashed: player1,
          p2Crashed: !player1,
          p1Time: p1stopwatch.elapsed,
          p2Time: p2stopwatch.elapsed,
        ),
      );
    }

    emit(
      currentState.copyWith(
        p1Landed: player1,
        p2Landed: !player1,
      ),
    );
  }

  void reset() {
    p1stopwatch.reset();
    p2stopwatch.reset();
    final highScore = storage.getScore();
    emit(
      Game2State.initial(
        p1Time: Duration(milliseconds: storage.mpGetScore(true)),
        p2Time: Duration(milliseconds: storage.mpGetScore(false)),
      ),
    );
  }

  void start([int level = 1]) {
    p1stopwatch.start();
    p2stopwatch.start();
    emit(
      Game2State.play(
        p1Time: p1stopwatch.elapsed,
        p2Time: p2stopwatch.elapsed,
        p1Landed: false,
        p2Landed: false,
        p1Crashed: false,
        p2Crashed: false,
        p1Fuel: 1,
        p2Fuel: 1,
        p1Speed: 0,
        p2Speed: 0,
      ),
    );
    timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      final currentState = state;
      if (currentState is! PlayGame2State) return;
      emit(
        currentState.copyWith(
          p1Time: p1stopwatch.elapsed,
          p2Time: p2stopwatch.elapsed,
        ),
      );
    });
  }

  void updateSpeed(bool player1, double speed) {
    final currentState = state;
    if (currentState is! PlayGame2State) return;

    if (player1) {
      emit(currentState.copyWith(p1Speed: speed));
    } else {
      emit(currentState.copyWith(p2Speed: speed));
    }
  }

  void boost(bool player1) {
    final currentState = state;
    if (currentState is! PlayGame2State) return;
    if (player1) {
      if (currentState.p1Fuel <= 0) {
        emit(currentState.copyWith(p1Fuel: 0));
      } else {
        emit(currentState.copyWith(p1Fuel: currentState.p1Fuel - 0.003));
      }
    } else {
      if (currentState.p2Fuel <= 0) {
        emit(currentState.copyWith(p2Fuel: 0));
      } else {
        emit(currentState.copyWith(p2Fuel: currentState.p2Fuel - 0.003));
      }
    }
  }

  Future<void> resetData() async {
    await storage.reset();
    emit(
      const Game2State.initial(
        p1Time: Duration.zero,
        p2Time: Duration.zero,
      ),
    );
  }
}
