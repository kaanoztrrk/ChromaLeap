import 'package:chromaleap/Feature/Ground/ground.dart';
import 'package:chromaleap/Feature/Rotater/circular_rotater.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'Model/Player/player.dart';

class ChromaLeap extends FlameGame with TapCallbacks {
  late Player player;

  final List<Color> gameColors;

  ChromaLeap(
      {this.gameColors = const [
        Colors.redAccent,
        Colors.greenAccent,
        Colors.blueAccent,
        Colors.yellowAccent,
      ]})
      : super(
            camera:
                CameraComponent.withFixedResolution(width: 600, height: 1500));

  @override
  // Game Background Color
  Color backgroundColor() => const Color(0xff222222);

  @override
  void onMount() {
    //* Debug Mode
    // debugMode = true;
    world.add(Ground(position: Vector2(0, 500)));
    world.add(player = Player(position: Vector2(0, 250)));
    generateGameComponents();
    super.onMount();
  }

  void generateGameComponents() {
    world.add(
        CircularRotator(position: Vector2(0, 100), size: Vector2(200, 200)));
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
