// ignore_for_file: lines_longer_than_80_chars

import 'package:flame/game.dart';
import 'package:flame_jam_2025/game/gravity_game.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/ui/game_over.dart';
import 'package:flame_jam_2025/ui/hud.dart';
import 'package:flame_jam_2025/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GravityWidget extends StatefulWidget {
  const GravityWidget({
    super.key,
  });

  @override
  State<GravityWidget> createState() => _GravityWidgetState();
}

class _GravityWidgetState extends State<GravityWidget> {
  late GravityGame game;
  late GameCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = GameCubit();
    game = GravityGame(cubit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<GameCubit, GameState>(
        bloc: cubit,
        listener: (context, state) {
          switch (state) {
            case InitialGameState _:
              game.overlays.clear();
              game.overlays.add('menu');
            case PlayGameState _:
              game.overlays.clear();
              game.overlays.add('hud');
            case GameOverGameState _:
              game.overlays.clear();
              game.overlays.add('game_over');
            case LevelClearGameState _:
              game.overlays.clear();
            // game.overlays.add('menu');
          }
        },
        child: GameWidget<GravityGame>(
          game: game,
          backgroundBuilder: (context) => Container(
            color: Colors.orange,
          ),
          loadingBuilder: (context) => Center(
            child: Text(
              'Loading...',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          overlayBuilderMap: {
            'hud': (_, game) => Hud(game),
            'menu': (_, game) => Menu(game),
            'game_over': (_, game) => GameOver(game, resetGame),
          },
          initialActiveOverlays: const ['menu'],
        ),
      ),
    );
  }

  void resetGame() {
    setState(() {
      game.reset();
      game = GravityGame(cubit);
      cubit.reset();
    });
  }
}
