// ignore_for_file: lines_longer_than_80_chars

import 'package:flame_jam_2025/game/gravity_game.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Hud extends StatelessWidget {
  const Hud(this.game, {super.key});

  final GravityGame game;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      bloc: game.gameCubit,
      builder: (context, state) {
        var score = 0;
        var health = 0.0;
        var speed = 0.0;
        var fuel = 0.0;
        var time = Duration.zero;

        if (state is PlayGameState) {
          score = state.currentScore;
          health = state.health;
          speed = state.speed;
          fuel = state.fuel;
          time = state.time;
        } else if (state is LevelClearGameState) {
          score = state.currentScore;
          health = state.health;
          speed = 0;
          fuel = state.fuel;
          time = state.time;
        } else {
          return const Offstage();
        }

        return Center(
          child: Stack(
            children: [
              Positioned(
                top: sizeM,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Score: $score',
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
              Positioned(
                top: sizeM * 3,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '❤️',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    spaceS,
                    SizedBox(
                      width: 100,
                      height: 10,
                      child: LinearProgressIndicator(
                        color: health > 0.5
                            ? Colors.green
                            : health < 0.2
                                ? Colors.red
                                : Colors.orange,
                        value: health,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: sizeM,
                right: sizeM,
                child: Text(
                  'Speed: ${speed.toStringAsFixed(2)} m/s',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Positioned(
                top: sizeM,
                left: sizeM,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fuel: ${(fuel * 100).toStringAsFixed(0)}%',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Time: ${(time.inMilliseconds / 1000).toStringAsFixed(1)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
