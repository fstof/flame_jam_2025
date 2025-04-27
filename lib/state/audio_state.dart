part of 'audio_cubit.dart';

@freezed
sealed class AudioState with _$AudioState {
  const factory AudioState({
    @Default(true) bool soundOn,
    @Default(true) bool musicOn,
  }) = _AudioState;
}
