import 'package:chromaleap/Feature/Rotater/Circle_arc.dart';
import 'package:chromaleap/app.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularRotator extends PositionComponent with HasGameRef<ChromaLeap> {
  CircularRotator({
    this.thickness = 8,
    required super.position,
    required super.size,
  })  : assert(size!.x == size.y),
        super(anchor: Anchor.center);

  final double thickness;

  @override
  void onLoad() {
    super.onLoad();
    const circle = math.pi * 2;
    final sweep = circle / gameRef.gameColors.length;
    for (var i = 0; i < gameRef.gameColors.length; i++) {
      final start = i * sweep;
      add(CircleArc(
          color: gameRef.gameColors[i], startAngle: start, sweepAngle: sweep));
    }
  }

  @override
  void render(Canvas canvas) {
    final radius = (size.x / 2) - (thickness / 2);

    /*
    canvas.drawArc(
        size.toRect(),
        0,
        3.13,
        false,
        Paint()
          ..color = Colors.redAccent
          ..style = PaintingStyle.stroke
          ..strokeWidth = thickness);
  
   */
    /*
    canvas.drawCircle(
        (size / 2).toOffset(),
        radius,
        Paint()
          ..color = Colors.blueAccent
          ..style = PaintingStyle.stroke
          ..strokeWidth = thickness); */
  }
}
