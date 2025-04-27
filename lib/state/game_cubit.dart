import 'dart:async';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:flame_jam_2025/storage/storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_cubit.freezed.dart';
part 'game_state.dart';

const int POINTS_PER_LEVEL = 1000;
const int LEVEL_COMPLETION_BONUS_SCALAR = 100;
const int POINTS_PER_SECOND = 2;
const int BOOSTER_LANDING_BONUS = 1500;
const double HARD_DIFFICULTY_MULTIPLIER = 1.75;
const double NORMAL_DIFFICULTY_MULTIPLIER = 1.0;

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameState.initial(hardMode: false, highScore: 0));
  Storage storage = Storage.instance;
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  void loadGame() {
    emit(
      GameState.initial(
        hardMode: false,
        highScore: storage.getScore(),
      ),
    );
  }

  int _calculateScore({
    required int currentLevel,
    required Duration time,
    required bool hardMode,
    required bool boosterLanded,
  }) {
    final levelsCompleted = math.max(0, currentLevel - 1);
    final levelScore = (levelsCompleted * POINTS_PER_LEVEL) +
        (levelsCompleted * levelsCompleted * LEVEL_COMPLETION_BONUS_SCALAR);
    final timeScore = time.inSeconds * POINTS_PER_SECOND;
    final boosterBonus = boosterLanded ? BOOSTER_LANDING_BONUS : 0;
    final difficultyMultiplier =
        hardMode ? HARD_DIFFICULTY_MULTIPLIER : NORMAL_DIFFICULTY_MULTIPLIER;
    final finalScore =
        ((levelScore + timeScore + boosterBonus) * difficultyMultiplier)
            .round();

    return finalScore;
  }

  void crash() {
    stopwatch.stop();
    final currentState = state;
    if (currentState is! PlayGameState) return;

    final score = _calculateScore(
      currentLevel: currentState.level,
      hardMode: state.hardMode,
      time: stopwatch.elapsed,
      boosterLanded: currentState.boosterLanded,
    );

    var highScore = storage.getScore();
    if (score > highScore) {
      highScore = score;
      storage.saveScore(score);
    }

    emit(
      GameState.gameOver(
        level: currentState.level,
        hardMode: state.hardMode,
        fuel: currentState.fuel,
        time: stopwatch.elapsed,
        crashSpeed: currentState.speed,
        highScore: highScore,
        currentScore: score,
        boosterLanded: currentState.boosterLanded,
      ),
    );
  }

  void win() {
    stopwatch.stop();
    final currentState = state;
    if (currentState is! PlayGameState) return;

    final score = _calculateScore(
      currentLevel: currentState.level,
      hardMode: state.hardMode,
      time: stopwatch.elapsed,
      boosterLanded: currentState.boosterLanded,
    );
    final highScore = storage.getScore();

    emit(
      GameState.levelClear(
        level: currentState.level,
        hardMode: state.hardMode,
        fuel: currentState.fuel,
        time: currentState.time,
        highScore: highScore,
        currentScore: score,
        boosterLanded: currentState.boosterLanded,
      ),
    );
  }

  void toggleHardMode() {
    if (state is! InitialGameState) return;

    emit(state.copyWith(hardMode: !state.hardMode));
  }

  void reset() {
    stopwatch.reset();
    final highScore = storage.getScore();
    emit(
      GameState.initial(hardMode: state.hardMode, highScore: highScore),
    );
  }

  void start([int level = 1]) {
    var fuel = 1.0;
    if (state is LevelClearGameState) {
      fuel = (state as LevelClearGameState).fuel;
    }
    var boosterLanded = false;
    if (state is LevelClearGameState) {
      boosterLanded = (state as LevelClearGameState).boosterLanded;
    }
    stopwatch.start();
    emit(
      GameState.play(
        level: level,
        hardMode: state.hardMode,
        fuel: fuel,
        time: stopwatch.elapsed,
        speed: 0,
        highScore: state.highScore,
        currentScore: 0,
        boosterLanded: boosterLanded,
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

    var score = currentState.currentScore;
    if (speed > 0.01) {
      score = _calculateScore(
        currentLevel: currentState.level,
        hardMode: state.hardMode,
        time: stopwatch.elapsed,
        boosterLanded: currentState.boosterLanded,
      );
    }

    emit(
      currentState.copyWith(
        speed: speed,
        currentScore: score,
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

  void boosterLanded() {
    final currentState = state;
    if (currentState is! PlayGameState) return;
    emit(currentState.copyWith(boosterLanded: true));
  }

  Future<void> resetData() async {
    await storage.reset();
    emit(
      GameState.initial(
        hardMode: false,
        highScore: storage.getScore(),
      ),
    );
  }
}
