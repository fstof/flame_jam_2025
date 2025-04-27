// ignore_for_file: lines_longer_than_80_chars

import 'package:flame_jam_2025/audio/audio_controller.dart';
import 'package:flame_jam_2025/audio/sounds.dart';
import 'package:flame_jam_2025/game/gravity_game.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameOver extends StatelessWidget {
  const GameOver(this.game, this.resetGame, {super.key});

  final void Function() resetGame;
  final GravityGame game;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      bloc: game.gameCubit,
      builder: (context, state) {
        if (state is! GameOverGameState) {
          return const Center(
            child: Text('not game over'),
          );
        }
        return Stack(
          children: [
            Positioned(
              top: sizeM,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Score: ${state.currentScore}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  spaceM,
                  Text(
                    '|',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  spaceM,
                  Text(
                    'High Score: ${state.highScore}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Game Over',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.red),
                  ),
                  spaceL,
                  Text(
                    'Levels Completed: ${state.level - 1}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  spaceM,
                  Text(
                    'Crash Speed: ${state.crashSpeed.toStringAsFixed(2)} m/s',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  spaceM,
                  ElevatedButton(
                    onPressed: () {
                      AudioController.instance.playSfx(SoundType.click);
                      resetGame();
                    },
                    child: const Text('Restart'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
