// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GameState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameState()';
  }
}

/// @nodoc
class $GameStateCopyWith<$Res> {
  $GameStateCopyWith(GameState _, $Res Function(GameState) __);
}

/// @nodoc

class InitialGameState implements GameState {
  const InitialGameState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialGameState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameState.initial()';
  }
}

/// @nodoc

class PlayGameState implements GameState {
  const PlayGameState(
      {required this.level,
      required this.fuel,
      required this.speed,
      required this.time});

  final int level;
  final double fuel;
  final double speed;
  final Duration time;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayGameStateCopyWith<PlayGameState> get copyWith =>
      _$PlayGameStateCopyWithImpl<PlayGameState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayGameState &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, fuel, speed, time);

  @override
  String toString() {
    return 'GameState.play(level: $level, fuel: $fuel, speed: $speed, time: $time)';
  }
}

/// @nodoc
abstract mixin class $PlayGameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $PlayGameStateCopyWith(
          PlayGameState value, $Res Function(PlayGameState) _then) =
      _$PlayGameStateCopyWithImpl;
  @useResult
  $Res call({int level, double fuel, double speed, Duration time});
}

/// @nodoc
class _$PlayGameStateCopyWithImpl<$Res>
    implements $PlayGameStateCopyWith<$Res> {
  _$PlayGameStateCopyWithImpl(this._self, this._then);

  final PlayGameState _self;
  final $Res Function(PlayGameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? fuel = null,
    Object? speed = null,
    Object? time = null,
  }) {
    return _then(PlayGameState(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      fuel: null == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class GameOverGameState implements GameState {
  const GameOverGameState(
      {required this.level,
      required this.fuel,
      required this.crashSpeed,
      required this.time});

  final int level;
  final double fuel;
  final double crashSpeed;
  final Duration time;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameOverGameStateCopyWith<GameOverGameState> get copyWith =>
      _$GameOverGameStateCopyWithImpl<GameOverGameState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameOverGameState &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.crashSpeed, crashSpeed) ||
                other.crashSpeed == crashSpeed) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, fuel, crashSpeed, time);

  @override
  String toString() {
    return 'GameState.gameOver(level: $level, fuel: $fuel, crashSpeed: $crashSpeed, time: $time)';
  }
}

/// @nodoc
abstract mixin class $GameOverGameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $GameOverGameStateCopyWith(
          GameOverGameState value, $Res Function(GameOverGameState) _then) =
      _$GameOverGameStateCopyWithImpl;
  @useResult
  $Res call({int level, double fuel, double crashSpeed, Duration time});
}

/// @nodoc
class _$GameOverGameStateCopyWithImpl<$Res>
    implements $GameOverGameStateCopyWith<$Res> {
  _$GameOverGameStateCopyWithImpl(this._self, this._then);

  final GameOverGameState _self;
  final $Res Function(GameOverGameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? fuel = null,
    Object? crashSpeed = null,
    Object? time = null,
  }) {
    return _then(GameOverGameState(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      fuel: null == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as double,
      crashSpeed: null == crashSpeed
          ? _self.crashSpeed
          : crashSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class LevelClearGameState implements GameState {
  const LevelClearGameState(
      {required this.level, required this.fuel, required this.time});

  final int level;
  final double fuel;
  final Duration time;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LevelClearGameStateCopyWith<LevelClearGameState> get copyWith =>
      _$LevelClearGameStateCopyWithImpl<LevelClearGameState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LevelClearGameState &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, fuel, time);

  @override
  String toString() {
    return 'GameState.levelClear(level: $level, fuel: $fuel, time: $time)';
  }
}

/// @nodoc
abstract mixin class $LevelClearGameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $LevelClearGameStateCopyWith(
          LevelClearGameState value, $Res Function(LevelClearGameState) _then) =
      _$LevelClearGameStateCopyWithImpl;
  @useResult
  $Res call({int level, double fuel, Duration time});
}

/// @nodoc
class _$LevelClearGameStateCopyWithImpl<$Res>
    implements $LevelClearGameStateCopyWith<$Res> {
  _$LevelClearGameStateCopyWithImpl(this._self, this._then);

  final LevelClearGameState _self;
  final $Res Function(LevelClearGameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? fuel = null,
    Object? time = null,
  }) {
    return _then(LevelClearGameState(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      fuel: null == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

// dart format on
