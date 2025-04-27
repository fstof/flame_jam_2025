import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  static Storage? _i;

  late Box<int> _scoreBox;
  late Box<bool> _settingsBox;

  Storage._();

  static Storage get instance => _i ??= Storage._();

  Future<void> initialise() async {
    await Hive.initFlutter();
    _scoreBox = await Hive.openBox('scoresBox');
    _settingsBox = await Hive.openBox('settingsBox');
  }

  Future<void> reset() async {
    await _scoreBox.clear();
    await _settingsBox.clear();
  }

  void saveScore(int score) {
    _scoreBox.put('score', score);
  }

  int getScore() {
    return _scoreBox.get('score') ?? 0;
  }

  void mpSaveScore(bool player1, int score) {
    _scoreBox.put('score-$player1', score);
  }

  int mpGetScore(bool player1) {
    return _scoreBox.get('score-$player1') ?? 0;
  }

  bool get musicOn {
    return _settingsBox.get('musicOn') ?? true;
  }

  void setMusicOn({required bool on}) {
    _settingsBox.put('musicOn', on);
  }

  bool get soundOn {
    return _settingsBox.get('soundOn') ?? true;
  }

  void setSoundOn({required bool on}) {
    _settingsBox.put('soundOn', on);
  }
}
