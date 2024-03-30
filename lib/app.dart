import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

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

class Player extends PositionComponent {
  final _velocity = Vector2(0, 30.0);
  final _gravity = 500.0;
  final _jumpSpeed = 350.0;

  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
    position = Vector2(100, 100);
  }

  @override
  void update(double dt) {
    // dt => Delta Time
    // print('update $dt');
    // 60 Fps => 60 times in a second ==> dt : 0.16667
    // y += speed;
    // 120 Fps => 120 times in a second ==> dt : 0.008333333
    // y += speed * dt;
    position += _velocity * dt;
    _velocity.y += _gravity * dt;
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // 60 Fps => 60 times in a second
    canvas.drawCircle(position.toOffset(), 20,
        Paint()..color = Color.fromARGB(255, 255, 230, 0));
  }

  void jump() {
    _velocity.y = _jumpSpeed;
  }
}
