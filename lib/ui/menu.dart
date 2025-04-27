import 'package:flame_jam_2025/audio/audio_controller.dart';
import 'package:flame_jam_2025/audio/sounds.dart';
import 'package:flame_jam_2025/game/gravity_game.dart';
import 'package:flame_jam_2025/state/audio_cubit.dart';
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
        return Stack(
          children: [
            Positioned(
              top: sizeM,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'High Score: ${state.highScore}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gravity Grappler',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 50,
                                color: Colors.yellow,
                              ),
                    ),
                    spaceL,
                    const Text('Press Space To Start'),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: sizeL,
              right: sizeM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Options',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.yellow)),
                  spaceM,
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
                        onPressed: () {
                          AudioController.instance.playSfx(SoundType.click);
                          context.read<GameCubit>().toggleHardMode();
                        },
                        child: Text(state.hardMode ? 'ON' : 'OFF'),
                      ),
                    ],
                  ),
                  BlocBuilder<AudioCubit, AudioState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Sound: '),
                          TextButton(
                            onPressed: () {
                              AudioController.instance.playSfx(SoundType.click);
                              context.read<AudioCubit>().toggleSound();
                            },
                            child: Text(state.soundOn ? 'ON' : 'OFF'),
                          ),
                        ],
                      );
                    },
                  ),
                  BlocBuilder<AudioCubit, AudioState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Music: '),
                          TextButton(
                            onPressed: () {
                              AudioController.instance.playSfx(SoundType.click);
                              context.read<AudioCubit>().toggleMusic();
                            },
                            child: Text(state.musicOn ? 'ON' : 'OFF'),
                          ),
                        ],
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      AudioController.instance.playSfx(SoundType.click);
                      context.read<GameCubit>().resetData();
                    },
                    child: const Text('Reset everything'),
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
