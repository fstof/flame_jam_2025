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
  bool get hardMode;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameStateCopyWith<GameState> get copyWith =>
      _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameState &&
            (identical(other.hardMode, hardMode) ||
                other.hardMode == hardMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hardMode);

  @override
  String toString() {
    return 'GameState(hardMode: $hardMode)';
  }
}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) =
      _$GameStateCopyWithImpl;
  @useResult
  $Res call({bool hardMode});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hardMode = null,
  }) {
    return _then(_self.copyWith(
      hardMode: null == hardMode
          ? _self.hardMode
          : hardMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class InitialGameState implements GameState {
  const InitialGameState({required this.hardMode});

  @override
  final bool hardMode;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitialGameStateCopyWith<InitialGameState> get copyWith =>
      _$InitialGameStateCopyWithImpl<InitialGameState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InitialGameState &&
            (identical(other.hardMode, hardMode) ||
                other.hardMode == hardMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hardMode);

  @override
  String toString() {
    return 'GameState.initial(hardMode: $hardMode)';
  }
}

/// @nodoc
abstract mixin class $InitialGameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $InitialGameStateCopyWith(
          InitialGameState value, $Res Function(InitialGameState) _then) =
      _$InitialGameStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool hardMode});
}

/// @nodoc
class _$InitialGameStateCopyWithImpl<$Res>
    implements $InitialGameStateCopyWith<$Res> {
  _$InitialGameStateCopyWithImpl(this._self, this._then);

  final InitialGameState _self;
  final $Res Function(InitialGameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hardMode = null,
  }) {
    return _then(InitialGameState(
      hardMode: null == hardMode
          ? _self.hardMode
          : hardMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class PlayGameState implements GameState {
  const PlayGameState(
      {required this.level,
      required this.hardMode,
      required this.fuel,
      required this.speed,
      required this.time});

  final int level;
  @override
  final bool hardMode;
  final double fuel;
  final double speed;
  final Duration time;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
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
            (identical(other.hardMode, hardMode) ||
                other.hardMode == hardMode) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, level, hardMode, fuel, speed, time);

  @override
  String toString() {
    return 'GameState.play(level: $level, hardMode: $hardMode, fuel: $fuel, speed: $speed, time: $time)';
  }
}

/// @nodoc
abstract mixin class $PlayGameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $PlayGameStateCopyWith(
          PlayGameState value, $Res Function(PlayGameState) _then) =
      _$PlayGameStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int level, bool hardMode, double fuel, double speed, Duration time});
}

/// @nodoc
class _$PlayGameStateCopyWithImpl<$Res>
    implements $PlayGameStateCopyWith<$Res> {
  _$PlayGameStateCopyWithImpl(this._self, this._then);

  final PlayGameState _self;
  final $Res Function(PlayGameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? hardMode = null,
    Object? fuel = null,
    Object? speed = null,
    Object? time = null,
  }) {
    return _then(PlayGameState(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      hardMode: null == hardMode
          ? _self.hardMode
          : hardMode // ignore: cast_nullable_to_non_nullable
              as bool,
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
      required this.hardMode,
      required this.fuel,
      required this.crashSpeed,
      required this.time});

  final int level;
  @override
  final bool hardMode;
  final double fuel;
  final double crashSpeed;
  final Duration time;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
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
            (identical(other.hardMode, hardMode) ||
                other.hardMode == hardMode) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.crashSpeed, crashSpeed) ||
                other.crashSpeed == crashSpeed) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, level, hardMode, fuel, crashSpeed, time);

  @override
  String toString() {
    return 'GameState.gameOver(level: $level, hardMode: $hardMode, fuel: $fuel, crashSpeed: $crashSpeed, time: $time)';
  }
}

/// @nodoc
abstract mixin class $GameOverGameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $GameOverGameStateCopyWith(
          GameOverGameState value, $Res Function(GameOverGameState) _then) =
      _$GameOverGameStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int level,
      bool hardMode,
      double fuel,
      double crashSpeed,
      Duration time});
}

/// @nodoc
class _$GameOverGameStateCopyWithImpl<$Res>
    implements $GameOverGameStateCopyWith<$Res> {
  _$GameOverGameStateCopyWithImpl(this._self, this._then);

  final GameOverGameState _self;
  final $Res Function(GameOverGameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? hardMode = null,
    Object? fuel = null,
    Object? crashSpeed = null,
    Object? time = null,
  }) {
    return _then(GameOverGameState(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      hardMode: null == hardMode
          ? _self.hardMode
          : hardMode // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {required this.level,
      required this.hardMode,
      required this.fuel,
      required this.time});

  final int level;
  @override
  final bool hardMode;
  final double fuel;
  final Duration time;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
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
            (identical(other.hardMode, hardMode) ||
                other.hardMode == hardMode) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, hardMode, fuel, time);

  @override
  String toString() {
    return 'GameState.levelClear(level: $level, hardMode: $hardMode, fuel: $fuel, time: $time)';
  }
}

/// @nodoc
abstract mixin class $LevelClearGameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $LevelClearGameStateCopyWith(
          LevelClearGameState value, $Res Function(LevelClearGameState) _then) =
      _$LevelClearGameStateCopyWithImpl;
  @override
  @useResult
  $Res call({int level, bool hardMode, double fuel, Duration time});
}

/// @nodoc
class _$LevelClearGameStateCopyWithImpl<$Res>
    implements $LevelClearGameStateCopyWith<$Res> {
  _$LevelClearGameStateCopyWithImpl(this._self, this._then);

  final LevelClearGameState _self;
  final $Res Function(LevelClearGameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? hardMode = null,
    Object? fuel = null,
    Object? time = null,
  }) {
    return _then(LevelClearGameState(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      hardMode: null == hardMode
          ? _self.hardMode
          : hardMode // ignore: cast_nullable_to_non_nullable
              as bool,
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
