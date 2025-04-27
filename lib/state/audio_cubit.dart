import 'package:bloc/bloc.dart';
import 'package:flame_jam_2025/audio/audio_controller.dart';
import 'package:flame_jam_2025/storage/storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_cubit.freezed.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit({required Storage storage})
      : _storage = storage,
        super(const AudioState()) {
    audioController = AudioController.instance;
  }

  final Storage _storage;
  late final AudioController audioController;

  Future<void> loadState() async {
    if (_storage.musicOn) {
      audioController.startMusic();
    } else {
      audioController.stopMusic();
    }
    if (_storage.soundOn) {
      audioController.volume = 1;
    } else {
      audioController.volume = 0;
    }
    emit(
      state.copyWith(
        musicOn: _storage.musicOn,
        soundOn: _storage.soundOn,
      ),
    );
  }

  Future<void> toggleMusic() async {
    final on = !state.musicOn;
    _storage.setMusicOn(on: on);
    if (on) {
      audioController.startMusic();
    } else {
      audioController.stopMusic();
    }
    if (!isClosed) {
      emit(state.copyWith(musicOn: !state.musicOn));
    }
  }

  Future<void> toggleSound() async {
    final on = !state.soundOn;
    _storage.setSoundOn(on: on);
    if (on) {
      audioController.volume = 1;
    } else {
      audioController.volume = 0;
    }
    if (!isClosed) {
      emit(state.copyWith(soundOn: !state.soundOn));
    }
  }

  @override
  Future<void> close() {
    audioController.dispose();
    return super.close();
  }
}
