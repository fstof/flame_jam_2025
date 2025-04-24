part of 'game_cubit.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.initial() = InitialGameState;
  const factory GameState.play({
    required int level,
    required double fuel,
    required double speed,
    required Duration time,
  }) = PlayGameState;
  const factory GameState.gameOver({
    required int level,
    required double fuel,
    required double crashSpeed,
    required Duration time,
  }) = GameOverGameState;
  const factory GameState.levelClear({
    required int level,
    required double fuel,
    required Duration time,
  }) = LevelClearGameState;
}
