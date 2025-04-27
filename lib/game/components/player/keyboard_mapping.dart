import 'package:flutter/services.dart';

class KeyboardMapping {
  const KeyboardMapping({
    required List<LogicalKeyboardKey> boostKeys,
    required List<LogicalKeyboardKey> leftKeys,
    required List<LogicalKeyboardKey> rightKeys,
  })  : _boostKeys = boostKeys,
        _leftKeys = leftKeys,
        _rightKeys = rightKeys;

  final List<LogicalKeyboardKey> _boostKeys;
  final List<LogicalKeyboardKey> _leftKeys;
  final List<LogicalKeyboardKey> _rightKeys;

  bool isBoostKey(Set<LogicalKeyboardKey> keys) {
    return keys.any(_boostKeys.contains);
  }

  bool isLeftKey(Set<LogicalKeyboardKey> keys) {
    return keys.any(_leftKeys.contains);
  }

  bool isRightKey(Set<LogicalKeyboardKey> keys) {
    return keys.any(_rightKeys.contains);
  }
}

const defaultKBMapping = KeyboardMapping(
  boostKeys: [LogicalKeyboardKey.space, LogicalKeyboardKey.arrowUp],
  leftKeys: [LogicalKeyboardKey.arrowLeft],
  rightKeys: [LogicalKeyboardKey.arrowRight],
);

// Example of how you might define WASD controls for a second player
const wasdKBMapping = KeyboardMapping(
  boostKeys: [LogicalKeyboardKey.keyW, LogicalKeyboardKey.shiftLeft],
  leftKeys: [LogicalKeyboardKey.keyA],
  rightKeys: [LogicalKeyboardKey.keyD],
);
