import 'package:flame_jam_2025/util/assets.dart';

List<String> soundNamesForType(SoundType type) {
  switch (type) {
    case SoundType.click:
      return const [
        sfxClick1,
        sfxClick2,
        sfxClick3,
      ];
    case SoundType.launch:
      return const [
        sfxLaunch,
      ];
    case SoundType.podBoost:
      return const [
        sfxPodBoost,
      ];
    case SoundType.podNudge:
      return const [
        sfxPodNudge,
      ];
    case SoundType.landing:
      return const [
        sfxLanding,
      ];
    case SoundType.crash:
      return const [
        sfxCrash1,
        sfxCrash2,
        sfxCrash3,
      ];
  }
}

enum SoundType {
  click,
  launch,
  podBoost,
  podNudge,
  crash,
  landing,
}
