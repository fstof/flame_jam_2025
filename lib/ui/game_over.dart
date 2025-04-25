// ignore_for_file: lines_longer_than_80_chars

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
      bloc: game.cubit,
      builder: (context, state) {
        if (state is! GameOverGameState) {
          return const Center(
            child: Text('not game over'),
          );
        }
        return Center(
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
              spaceM,
              Text(
                'Level: ${state.level}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              spaceM,
              Text(
                'Fuel: ${(state.fuel * 100).toStringAsFixed(0)}%',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              spaceM,
              Text(
                'Crash Speed: ${state.crashSpeed.toStringAsFixed(2)} m/s',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Time: ${(state.time.inMilliseconds / 1000).toStringAsFixed(1)} seconds',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              spaceM,
              ElevatedButton(
                onPressed: resetGame,
                child: const Text('Restart'),
              ),
            ],
          ),
        );
      },
    );
  }

  // void resetGame(BuildContext context) {
  //   game.reset();
  //   myGame = MyGame(cubit);
  //   context.read<GameCubit>().reset();
  // }
}
