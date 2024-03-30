import 'package:chromaleap/Feature/Ground/ground.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'Model/Player/player.dart';

class ChromaLeap extends FlameGame with TapCallbacks {
  late Player player;

  ChromaLeap()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: 600,
            height: 1000,
          ),
        );

  @override
  // Game Background Color
  Color backgroundColor() => const Color(0xff222222);

  @override
  void onMount() {
    debugMode = true;
    world.add(Ground(position: Vector2(0, 400)));
    world.add(player = Player());

    super.onMount();
  }

  //* camera
  @override
  void update(double dt) {
    final cameraY = camera.viewfinder.position.y;
    final playerY = player.position.y;

    if (playerY < cameraY) {
      camera.viewfinder.position = Vector2(0, playerY);
    }
    super.update(dt);
  }

  //* Jump Method
  @override
  void onTapDown(TapDownEvent event) {
    print('onTapDown()');
    player.jump();
    super.onTapDown(event);
  }
}
