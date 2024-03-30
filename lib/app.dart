import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'Model/Player/player.dart';

class ChromaLeap extends FlameGame with TapCallbacks {
  late Player player;

  @override
  // Game Background Color
  Color backgroundColor() => const Color(0xff222222);

  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
    add(player = Player());
  }

  @override
  void onTapDown(TapDownEvent event) {
    print('onTapDown()');
    player.jump();
    super.onTapDown(event);
  }
}
