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
      bloc: game.cubit,
      builder: (context, state) {
        if (state is! PlayGameState) return const Offstage();

        return Center(
          child: Stack(
            children: [
              Positioned(
                top: sizeM,
                right: sizeM,
                child: Text(
                  'Speed: ${state.speed.toStringAsFixed(2)} m/s',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Positioned(
                top: sizeM,
                left: sizeM,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fuel: ${(state.fuel * 100).toStringAsFixed(0)}%',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Time: ${(state.time.inMilliseconds / 1000).toStringAsFixed(1)}',
                      style: Theme.of(context).textTheme.headlineMedium,
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
