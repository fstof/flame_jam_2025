part of 'game_cubit.dart';

@freezed
sealed class GameState with _$GameState {
  const factory GameState.initial({
    required bool hardMode,
    required int highScore,
  }) = InitialGameState;
  const factory GameState.play({
    required int level,
    required bool hardMode,
    required double fuel,
    required double speed,
    required Duration time,
    required int highScore,
    required int currentScore,
    required bool boosterLanded,
  }) = PlayGameState;
  const factory GameState.gameOver({
    required int level,
    required bool hardMode,
    required double fuel,
    required double crashSpeed,
    required Duration time,
    required int highScore,
    required int currentScore,
    required bool boosterLanded,
  }) = GameOverGameState;
  const factory GameState.levelClear({
    required int level,
    required bool hardMode,
    required double fuel,
    required Duration time,
    required int highScore,
    required int currentScore,
    required bool boosterLanded,
  }) = LevelClearGameState;
}
