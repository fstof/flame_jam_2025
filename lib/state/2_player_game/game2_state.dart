part of 'game2_cubit.dart';

@freezed
sealed class Game2State with _$Game2State {
  const factory Game2State.initial({
    required Duration p1Time,
    required Duration p2Time,
  }) = InitialGame2State;
  const factory Game2State.play({
    required Duration p1Time,
    required Duration p2Time,
    required bool p1Landed,
    required bool p2Landed,
    required bool p1Crashed,
    required bool p2Crashed,
    required double p1Fuel,
    required double p2Fuel,
    required double p1Speed,
    required double p2Speed,
  }) = PlayGame2State;
  const factory Game2State.gameOver({
    required Duration p1Time,
    required Duration p2Time,
    required double p1Fuel,
    required double p2Fuel,
    required double p1crashSpeed,
    required double p2crashSpeed,
  }) = GameOverGame2State;
  const factory Game2State.levelClear({
    required Duration p1Time,
    required Duration p2Time,
    required double p1Fuel,
    required double p2Fuel,
  }) = LevelClearGame2State;
}
