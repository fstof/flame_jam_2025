import 'dart:collection';
import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flame_jam_2025/audio/sounds.dart';
import 'package:flame_jam_2025/storage/storage.dart';
import 'package:flame_jam_2025/util/assets.dart';

class AudioController {
  static AudioController? _i;
  final Random _random = Random();

  final Storage _storage;
  final Queue<String> _playlist;
  double _volume;

  AudioController._()
      : _storage = Storage.instance,
        _playlist = Queue.of([bgmPath]),
        _volume = 1.0;

  static AudioController get instance => _i ??= AudioController._();

  void dispose() {
    stopMusic();
  }

  set volume(double volume) {
    _volume = volume;
  }

  Future<AudioPlayer?> playSfx(SoundType type) async {
    if (!_storage.soundOn) return null;

    final options = soundNamesForType(type);
    final filename = options[_random.nextInt(options.length)];

    return FlameAudio.play(filename, volume: _volume);
  }

  void startMusic() {
    if (_storage.musicOn) {
      FlameAudio.bgm.play(_playlist.first);
    }
  }

  void stopMusic() {
    FlameAudio.bgm.pause();
  }
}
