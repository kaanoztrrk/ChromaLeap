import 'package:chromaleap/Feature/Rotater/circular_rotater.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CircleArc extends PositionComponent with ParentIsA<CircularRotator> {
  final Color color;
  final double startAngle;
  final double sweepAngle;

  CircleArc({
    required this.color,
    required this.startAngle,
    required this.sweepAngle,
  }) : super(anchor: Anchor.center);

  @override
  void onMount() {
    size = parent.size;
    position = size / 2;
    super.onMount();
  }

  @override
  void render(Canvas canvas) {
    final radius = (size.x / 2) - (parent.thickness / 2);
    canvas.drawArc(
        size.toRect()..deflate(parent.thickness / 2),
        startAngle,
        sweepAngle,
        false,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = parent.thickness);
  }
}
