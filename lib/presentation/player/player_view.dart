import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/player/player_bloc.dart';

class PlayerView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final playerBloc = useProvider(playerBlocProvider);
    final playerState = useProvider(playerBlocProvider.state);
    return Scaffold(
      body: ListView.builder(
        itemCount: playerState.recentlyPlayed.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(playerState.recentlyPlayed[index].name),
            subtitle: Text(playerState.recentlyPlayed[index].artistName),
            onTap: () {
              playerBloc.play(playerState.recentlyPlayed[index]);
            },
          );
        },
      ),
    );
  }
}
