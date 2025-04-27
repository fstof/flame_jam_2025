// ignore_for_file: lines_longer_than_80_chars

import 'package:flame/game.dart';
import 'package:flame_jam_2025/game/gravity_game.dart';
import 'package:flame_jam_2025/state/2_player_game/game2_cubit.dart';
import 'package:flame_jam_2025/state/audio_cubit.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/storage/storage.dart';
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
  late GameCubit gameCubit;
  late Game2Cubit game2Cubit;
  late AudioCubit audioCubit;
  bool singlePlayer = true;

  @override
  void initState() {
    super.initState();

    gameCubit = GameCubit()..loadGame();
    game2Cubit = Game2Cubit()..loadGame();
    audioCubit = AudioCubit(
      storage: Storage.instance,
    )..loadState();
    game = GravityGame(
      gameCubit: gameCubit,
      game2Cubit: game2Cubit,
      audioCubit: audioCubit,
      players: singlePlayer ? 1 : 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameCubit>.value(
          value: gameCubit,
        ),
        BlocProvider<Game2Cubit>.value(
          value: game2Cubit,
        ),
        BlocProvider<AudioCubit>.value(
          value: audioCubit,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GameCubit, GameState>(
            bloc: gameCubit,
            listener: (context, state) {
              switch (state) {
                case PlayGameState _:
                  game.overlays.clear();
                  game.overlays.add('hud');
                case GameOverGameState _:
                  game.overlays.clear();
                  game.overlays.add('game_over');
                case LevelClearGameState _:
                  game.overlays.clear();
                case InitialGameState _:
              }
            },
          ),
          BlocListener<Game2Cubit, Game2State>(
            listener: (context, state) {
              switch (state) {
                case PlayGame2State _:
                  game.overlays.clear();
                  game.overlays.add('hud');
                case GameOverGame2State _:
                  game.overlays.clear();
                  game.overlays.add('game_over');
                case LevelClearGame2State _:
                  game.overlays.clear();
                case InitialGame2State _:
              }
            },
          ),
        ],
        child: Stack(
          children: [
            GameWidget<GravityGame>(
              game: game,
              backgroundBuilder: (context) => Container(
                color: Colors.black,
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
            Positioned(
              bottom: 0,
              right: 0,
              child: TextButton(
                onPressed: () => setState(() {
                  singlePlayer = !singlePlayer;
                  resetGame();
                }),
                child: Text(singlePlayer ? 'Single Player' : 'Multi Player'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resetGame() {
    setState(() {
      game.reset();
      game = GravityGame(
        gameCubit: gameCubit,
        game2Cubit: game2Cubit,
        audioCubit: audioCubit,
        players: singlePlayer ? 1 : 2,
      );
      gameCubit.reset();
    });
  }
}
