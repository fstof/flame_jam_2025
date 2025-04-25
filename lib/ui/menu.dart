import 'package:flame_jam_2025/game/gravity_game.dart';
import 'package:flame_jam_2025/state/game_cubit.dart';
import 'package:flame_jam_2025/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Menu extends StatelessWidget {
  const Menu(this.game, {super.key});

  final GravityGame game;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gravity Grappler',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              spaceL,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Hard Mode: '),
                      Text(
                        '(Turning uses fuel)',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => context.read<GameCubit>().toggleHardMode(),
                    child: Text(state.hardMode ? 'ON' : 'OFF'),
                  ),
                ],
              ),
              spaceL,
              const Text('Start game by pressing space'),
            ],
          ),
        );
      },
    );
  }
}
