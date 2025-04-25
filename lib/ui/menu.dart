import 'package:flame_jam_2025/game/gravity_game.dart';
import 'package:flame_jam_2025/ui/theme.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu(this.game, {super.key});

  final GravityGame game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Gravity Grappler',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          spaceM,
          const Text('Start game by pressing space'),
        ],
      ),
    );
  }
}
