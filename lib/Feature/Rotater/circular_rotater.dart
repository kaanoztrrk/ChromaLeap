import 'package:chromaleap/Feature/Rotater/Circle_arc.dart';
import 'package:chromaleap/app.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularRotator extends PositionComponent with HasGameRef<ChromaLeap> {
  CircularRotator({
    this.thickness = 8,
    this.rotationSpeed = 2,
    required super.position,
    required super.size,
  })  : assert(size!.x == size.y),
        super(anchor: Anchor.center);

  final double thickness;
  final double rotationSpeed;

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
    add(RotateEffect.to(
        circle,
        EffectController(
          speed: rotationSpeed,
          infinite: true,
        )));
  }
}
