// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioState {
  bool get soundOn;
  bool get musicOn;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AudioStateCopyWith<AudioState> get copyWith =>
      _$AudioStateCopyWithImpl<AudioState>(this as AudioState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AudioState &&
            (identical(other.soundOn, soundOn) || other.soundOn == soundOn) &&
            (identical(other.musicOn, musicOn) || other.musicOn == musicOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, soundOn, musicOn);

  @override
  String toString() {
    return 'AudioState(soundOn: $soundOn, musicOn: $musicOn)';
  }
}

/// @nodoc
abstract mixin class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) _then) =
      _$AudioStateCopyWithImpl;
  @useResult
  $Res call({bool soundOn, bool musicOn});
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res> implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._self, this._then);

  final AudioState _self;
  final $Res Function(AudioState) _then;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundOn = null,
    Object? musicOn = null,
  }) {
    return _then(_self.copyWith(
      soundOn: null == soundOn
          ? _self.soundOn
          : soundOn // ignore: cast_nullable_to_non_nullable
              as bool,
      musicOn: null == musicOn
          ? _self.musicOn
          : musicOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _AudioState implements AudioState {
  const _AudioState({this.soundOn = true, this.musicOn = true});

  @override
  @JsonKey()
  final bool soundOn;
  @override
  @JsonKey()
  final bool musicOn;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AudioStateCopyWith<_AudioState> get copyWith =>
      __$AudioStateCopyWithImpl<_AudioState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AudioState &&
            (identical(other.soundOn, soundOn) || other.soundOn == soundOn) &&
            (identical(other.musicOn, musicOn) || other.musicOn == musicOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, soundOn, musicOn);

  @override
  String toString() {
    return 'AudioState(soundOn: $soundOn, musicOn: $musicOn)';
  }
}

/// @nodoc
abstract mixin class _$AudioStateCopyWith<$Res>
    implements $AudioStateCopyWith<$Res> {
  factory _$AudioStateCopyWith(
          _AudioState value, $Res Function(_AudioState) _then) =
      __$AudioStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool soundOn, bool musicOn});
}

/// @nodoc
class __$AudioStateCopyWithImpl<$Res> implements _$AudioStateCopyWith<$Res> {
  __$AudioStateCopyWithImpl(this._self, this._then);

  final _AudioState _self;
  final $Res Function(_AudioState) _then;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? soundOn = null,
    Object? musicOn = null,
  }) {
    return _then(_AudioState(
      soundOn: null == soundOn
          ? _self.soundOn
          : soundOn // ignore: cast_nullable_to_non_nullable
              as bool,
      musicOn: null == musicOn
          ? _self.musicOn
          : musicOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
