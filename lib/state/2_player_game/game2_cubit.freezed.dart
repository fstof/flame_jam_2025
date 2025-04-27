// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game2_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Game2State {
  Duration get p1Time;
  Duration get p2Time;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Game2StateCopyWith<Game2State> get copyWith =>
      _$Game2StateCopyWithImpl<Game2State>(this as Game2State, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Game2State &&
            (identical(other.p1Time, p1Time) || other.p1Time == p1Time) &&
            (identical(other.p2Time, p2Time) || other.p2Time == p2Time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, p1Time, p2Time);

  @override
  String toString() {
    return 'Game2State(p1Time: $p1Time, p2Time: $p2Time)';
  }
}

/// @nodoc
abstract mixin class $Game2StateCopyWith<$Res> {
  factory $Game2StateCopyWith(
          Game2State value, $Res Function(Game2State) _then) =
      _$Game2StateCopyWithImpl;
  @useResult
  $Res call({Duration p1Time, Duration p2Time});
}

/// @nodoc
class _$Game2StateCopyWithImpl<$Res> implements $Game2StateCopyWith<$Res> {
  _$Game2StateCopyWithImpl(this._self, this._then);

  final Game2State _self;
  final $Res Function(Game2State) _then;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p1Time = null,
    Object? p2Time = null,
  }) {
    return _then(_self.copyWith(
      p1Time: null == p1Time
          ? _self.p1Time
          : p1Time // ignore: cast_nullable_to_non_nullable
              as Duration,
      p2Time: null == p2Time
          ? _self.p2Time
          : p2Time // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class InitialGame2State implements Game2State {
  const InitialGame2State({required this.p1Time, required this.p2Time});

  @override
  final Duration p1Time;
  @override
  final Duration p2Time;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitialGame2StateCopyWith<InitialGame2State> get copyWith =>
      _$InitialGame2StateCopyWithImpl<InitialGame2State>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InitialGame2State &&
            (identical(other.p1Time, p1Time) || other.p1Time == p1Time) &&
            (identical(other.p2Time, p2Time) || other.p2Time == p2Time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, p1Time, p2Time);

  @override
  String toString() {
    return 'Game2State.initial(p1Time: $p1Time, p2Time: $p2Time)';
  }
}

/// @nodoc
abstract mixin class $InitialGame2StateCopyWith<$Res>
    implements $Game2StateCopyWith<$Res> {
  factory $InitialGame2StateCopyWith(
          InitialGame2State value, $Res Function(InitialGame2State) _then) =
      _$InitialGame2StateCopyWithImpl;
  @override
  @useResult
  $Res call({Duration p1Time, Duration p2Time});
}

/// @nodoc
class _$InitialGame2StateCopyWithImpl<$Res>
    implements $InitialGame2StateCopyWith<$Res> {
  _$InitialGame2StateCopyWithImpl(this._self, this._then);

  final InitialGame2State _self;
  final $Res Function(InitialGame2State) _then;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? p1Time = null,
    Object? p2Time = null,
  }) {
    return _then(InitialGame2State(
      p1Time: null == p1Time
          ? _self.p1Time
          : p1Time // ignore: cast_nullable_to_non_nullable
              as Duration,
      p2Time: null == p2Time
          ? _self.p2Time
          : p2Time // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class PlayGame2State implements Game2State {
  const PlayGame2State(
      {required this.p1Time,
      required this.p2Time,
      required this.p1Landed,
      required this.p2Landed,
      required this.p1Crashed,
      required this.p2Crashed,
      required this.p1Fuel,
      required this.p2Fuel,
      required this.p1Speed,
      required this.p2Speed});

  @override
  final Duration p1Time;
  @override
  final Duration p2Time;
  final bool p1Landed;
  final bool p2Landed;
  final bool p1Crashed;
  final bool p2Crashed;
  final double p1Fuel;
  final double p2Fuel;
  final double p1Speed;
  final double p2Speed;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayGame2StateCopyWith<PlayGame2State> get copyWith =>
      _$PlayGame2StateCopyWithImpl<PlayGame2State>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayGame2State &&
            (identical(other.p1Time, p1Time) || other.p1Time == p1Time) &&
            (identical(other.p2Time, p2Time) || other.p2Time == p2Time) &&
            (identical(other.p1Landed, p1Landed) ||
                other.p1Landed == p1Landed) &&
            (identical(other.p2Landed, p2Landed) ||
                other.p2Landed == p2Landed) &&
            (identical(other.p1Crashed, p1Crashed) ||
                other.p1Crashed == p1Crashed) &&
            (identical(other.p2Crashed, p2Crashed) ||
                other.p2Crashed == p2Crashed) &&
            (identical(other.p1Fuel, p1Fuel) || other.p1Fuel == p1Fuel) &&
            (identical(other.p2Fuel, p2Fuel) || other.p2Fuel == p2Fuel) &&
            (identical(other.p1Speed, p1Speed) || other.p1Speed == p1Speed) &&
            (identical(other.p2Speed, p2Speed) || other.p2Speed == p2Speed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, p1Time, p2Time, p1Landed,
      p2Landed, p1Crashed, p2Crashed, p1Fuel, p2Fuel, p1Speed, p2Speed);

  @override
  String toString() {
    return 'Game2State.play(p1Time: $p1Time, p2Time: $p2Time, p1Landed: $p1Landed, p2Landed: $p2Landed, p1Crashed: $p1Crashed, p2Crashed: $p2Crashed, p1Fuel: $p1Fuel, p2Fuel: $p2Fuel, p1Speed: $p1Speed, p2Speed: $p2Speed)';
  }
}

/// @nodoc
abstract mixin class $PlayGame2StateCopyWith<$Res>
    implements $Game2StateCopyWith<$Res> {
  factory $PlayGame2StateCopyWith(
          PlayGame2State value, $Res Function(PlayGame2State) _then) =
      _$PlayGame2StateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Duration p1Time,
      Duration p2Time,
      bool p1Landed,
      bool p2Landed,
      bool p1Crashed,
      bool p2Crashed,
      double p1Fuel,
      double p2Fuel,
      double p1Speed,
      double p2Speed});
}

/// @nodoc
class _$PlayGame2StateCopyWithImpl<$Res>
    implements $PlayGame2StateCopyWith<$Res> {
  _$PlayGame2StateCopyWithImpl(this._self, this._then);

  final PlayGame2State _self;
  final $Res Function(PlayGame2State) _then;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? p1Time = null,
    Object? p2Time = null,
    Object? p1Landed = null,
    Object? p2Landed = null,
    Object? p1Crashed = null,
    Object? p2Crashed = null,
    Object? p1Fuel = null,
    Object? p2Fuel = null,
    Object? p1Speed = null,
    Object? p2Speed = null,
  }) {
    return _then(PlayGame2State(
      p1Time: null == p1Time
          ? _self.p1Time
          : p1Time // ignore: cast_nullable_to_non_nullable
              as Duration,
      p2Time: null == p2Time
          ? _self.p2Time
          : p2Time // ignore: cast_nullable_to_non_nullable
              as Duration,
      p1Landed: null == p1Landed
          ? _self.p1Landed
          : p1Landed // ignore: cast_nullable_to_non_nullable
              as bool,
      p2Landed: null == p2Landed
          ? _self.p2Landed
          : p2Landed // ignore: cast_nullable_to_non_nullable
              as bool,
      p1Crashed: null == p1Crashed
          ? _self.p1Crashed
          : p1Crashed // ignore: cast_nullable_to_non_nullable
              as bool,
      p2Crashed: null == p2Crashed
          ? _self.p2Crashed
          : p2Crashed // ignore: cast_nullable_to_non_nullable
              as bool,
      p1Fuel: null == p1Fuel
          ? _self.p1Fuel
          : p1Fuel // ignore: cast_nullable_to_non_nullable
              as double,
      p2Fuel: null == p2Fuel
          ? _self.p2Fuel
          : p2Fuel // ignore: cast_nullable_to_non_nullable
              as double,
      p1Speed: null == p1Speed
          ? _self.p1Speed
          : p1Speed // ignore: cast_nullable_to_non_nullable
              as double,
      p2Speed: null == p2Speed
          ? _self.p2Speed
          : p2Speed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class GameOverGame2State implements Game2State {
  const GameOverGame2State(
      {required this.p1Time,
      required this.p2Time,
      required this.p1Fuel,
      required this.p2Fuel,
      required this.p1crashSpeed,
      required this.p2crashSpeed});

  @override
  final Duration p1Time;
  @override
  final Duration p2Time;
  final double p1Fuel;
  final double p2Fuel;
  final double p1crashSpeed;
  final double p2crashSpeed;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameOverGame2StateCopyWith<GameOverGame2State> get copyWith =>
      _$GameOverGame2StateCopyWithImpl<GameOverGame2State>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameOverGame2State &&
            (identical(other.p1Time, p1Time) || other.p1Time == p1Time) &&
            (identical(other.p2Time, p2Time) || other.p2Time == p2Time) &&
            (identical(other.p1Fuel, p1Fuel) || other.p1Fuel == p1Fuel) &&
            (identical(other.p2Fuel, p2Fuel) || other.p2Fuel == p2Fuel) &&
            (identical(other.p1crashSpeed, p1crashSpeed) ||
                other.p1crashSpeed == p1crashSpeed) &&
            (identical(other.p2crashSpeed, p2crashSpeed) ||
                other.p2crashSpeed == p2crashSpeed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, p1Time, p2Time, p1Fuel, p2Fuel, p1crashSpeed, p2crashSpeed);

  @override
  String toString() {
    return 'Game2State.gameOver(p1Time: $p1Time, p2Time: $p2Time, p1Fuel: $p1Fuel, p2Fuel: $p2Fuel, p1crashSpeed: $p1crashSpeed, p2crashSpeed: $p2crashSpeed)';
  }
}

/// @nodoc
abstract mixin class $GameOverGame2StateCopyWith<$Res>
    implements $Game2StateCopyWith<$Res> {
  factory $GameOverGame2StateCopyWith(
          GameOverGame2State value, $Res Function(GameOverGame2State) _then) =
      _$GameOverGame2StateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Duration p1Time,
      Duration p2Time,
      double p1Fuel,
      double p2Fuel,
      double p1crashSpeed,
      double p2crashSpeed});
}

/// @nodoc
class _$GameOverGame2StateCopyWithImpl<$Res>
    implements $GameOverGame2StateCopyWith<$Res> {
  _$GameOverGame2StateCopyWithImpl(this._self, this._then);

  final GameOverGame2State _self;
  final $Res Function(GameOverGame2State) _then;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? p1Time = null,
    Object? p2Time = null,
    Object? p1Fuel = null,
    Object? p2Fuel = null,
    Object? p1crashSpeed = null,
    Object? p2crashSpeed = null,
  }) {
    return _then(GameOverGame2State(
      p1Time: null == p1Time
          ? _self.p1Time
          : p1Time // ignore: cast_nullable_to_non_nullable
              as Duration,
      p2Time: null == p2Time
          ? _self.p2Time
          : p2Time // ignore: cast_nullable_to_non_nullable
              as Duration,
      p1Fuel: null == p1Fuel
          ? _self.p1Fuel
          : p1Fuel // ignore: cast_nullable_to_non_nullable
              as double,
      p2Fuel: null == p2Fuel
          ? _self.p2Fuel
          : p2Fuel // ignore: cast_nullable_to_non_nullable
              as double,
      p1crashSpeed: null == p1crashSpeed
          ? _self.p1crashSpeed
          : p1crashSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      p2crashSpeed: null == p2crashSpeed
          ? _self.p2crashSpeed
          : p2crashSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class LevelClearGame2State implements Game2State {
  const LevelClearGame2State(
      {required this.p1Time,
      required this.p2Time,
      required this.p1Fuel,
      required this.p2Fuel});

  @override
  final Duration p1Time;
  @override
  final Duration p2Time;
  final double p1Fuel;
  final double p2Fuel;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LevelClearGame2StateCopyWith<LevelClearGame2State> get copyWith =>
      _$LevelClearGame2StateCopyWithImpl<LevelClearGame2State>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LevelClearGame2State &&
            (identical(other.p1Time, p1Time) || other.p1Time == p1Time) &&
            (identical(other.p2Time, p2Time) || other.p2Time == p2Time) &&
            (identical(other.p1Fuel, p1Fuel) || other.p1Fuel == p1Fuel) &&
            (identical(other.p2Fuel, p2Fuel) || other.p2Fuel == p2Fuel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, p1Time, p2Time, p1Fuel, p2Fuel);

  @override
  String toString() {
    return 'Game2State.levelClear(p1Time: $p1Time, p2Time: $p2Time, p1Fuel: $p1Fuel, p2Fuel: $p2Fuel)';
  }
}

/// @nodoc
abstract mixin class $LevelClearGame2StateCopyWith<$Res>
    implements $Game2StateCopyWith<$Res> {
  factory $LevelClearGame2StateCopyWith(LevelClearGame2State value,
          $Res Function(LevelClearGame2State) _then) =
      _$LevelClearGame2StateCopyWithImpl;
  @override
  @useResult
  $Res call({Duration p1Time, Duration p2Time, double p1Fuel, double p2Fuel});
}

/// @nodoc
class _$LevelClearGame2StateCopyWithImpl<$Res>
    implements $LevelClearGame2StateCopyWith<$Res> {
  _$LevelClearGame2StateCopyWithImpl(this._self, this._then);

  final LevelClearGame2State _self;
  final $Res Function(LevelClearGame2State) _then;

  /// Create a copy of Game2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? p1Time = null,
    Object? p2Time = null,
    Object? p1Fuel = null,
    Object? p2Fuel = null,
  }) {
    return _then(LevelClearGame2State(
      p1Time: null == p1Time
          ? _self.p1Time
          : p1Time // ignore: cast_nullable_to_non_nullable
              as Duration,
      p2Time: null == p2Time
          ? _self.p2Time
          : p2Time // ignore: cast_nullable_to_non_nullable
              as Duration,
      p1Fuel: null == p1Fuel
          ? _self.p1Fuel
          : p1Fuel // ignore: cast_nullable_to_non_nullable
              as double,
      p2Fuel: null == p2Fuel
          ? _self.p2Fuel
          : p2Fuel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
