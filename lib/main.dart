// ignore_for_file: lines_longer_than_80_chars

import 'package:flame/game.dart';
import 'package:flame_jam_2025/game/game.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyGame myGame;
  late GameCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = GameCubit();
    myGame = MyGame(cubit);
  }

  void resetGame() {
    setState(() {
      myGame.reset();
      myGame = MyGame(cubit);
      cubit.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: BlocConsumer<GameCubit, GameState>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: (state is PlayGameState)
                  ? Text('Level ${(state as PlayGameState).level}')
                  : const Offstage(),
              actions: [
                IconButton(
                  onPressed: resetGame,
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            body: Stack(
              children: [
                GameWidget(game: myGame),
                if (state is PlayGameState) ...[
                  Positioned(
                    top: sizeM,
                    right: sizeM,
                    child: Text(
                      'Speed: ${state.speed.toStringAsFixed(2)} m/s',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.white),
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
                if (state is GameOverGameState)
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white),
                        ),
                        spaceM,
                        ElevatedButton(
                          onPressed: resetGame,
                          child: const Text('Restart'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // body: const GameWidget.controlled(gameFactory: MyGame.new),
        ),
      ),
    );
  }
}
