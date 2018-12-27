import 'dart:math';

import 'package:flutter/material.dart';

class CircleBlurPainter extends CustomPainter {

  CircleBlurPainter(
      {@required this.circleWidth, this.colors, this.callback, this.selectedColor});

  final double circleWidth;
  final List<Color> colors;
  double padding;
  int selectedColor;
  final Function(int) callback;

  @override
  void paint(Canvas canvas, Size size) {
    padding = 25;
    double currentPosition = 0;
    for (int i = 0; i < this.colors.length; i++) {
      currentPosition += padding;
      if (this.selectedColor != i) {
        Paint blurPaint = new Paint()
          ..color = colors[i]
          ..style = PaintingStyle.fill
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10.0);
        Offset center = new Offset(
            circleWidth / 2 + currentPosition, circleWidth / 2);
        double radius = 80 / 100 * circleWidth / 2;
        canvas.drawCircle(center, radius, blurPaint);
        Paint innerPaint = new Paint()
          ..color = colors[i]
          ..style = PaintingStyle.fill;
        center = new Offset(circleWidth / 2 + currentPosition, circleWidth / 2);
        radius = 60 / 100 * circleWidth / 2;
        canvas.drawCircle(center, radius, innerPaint);
        Paint whitePaint = new Paint()
          ..color = Colors.white
          ..strokeWidth = circleWidth
          ..blendMode = BlendMode.src
          ..style = PaintingStyle.stroke;
        center = new Offset(circleWidth / 2 + currentPosition, circleWidth / 2);
        radius = circleWidth;
        canvas.drawCircle(center, radius, whitePaint);
      } else {
        Paint innerPaint = new Paint()
          ..color = colors[i]
          ..style = PaintingStyle.fill;
        Offset center =
        new Offset(circleWidth / 2 + currentPosition, circleWidth / 2);
        double radius = circleWidth / 2;
        canvas.drawCircle(center, radius, innerPaint);
        // Need to refactor this ugly piece of shit....
        Path path = new Path();
        path.moveTo(currentPosition + circleWidth / 4 - 0.5, circleWidth / 2 + 0.5);
        path.lineTo(
            currentPosition + circleWidth / 2 - 1, circleWidth - circleWidth / 4 - 2);
        path.lineTo(
            currentPosition + circleWidth - circleWidth / 3 + 1, circleWidth / 3);
        Paint tickPaint = new Paint()
          ..color = Colors.white
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;
        canvas.drawPath(path, tickPaint);
      }
      currentPosition += circleWidth;
    }
  }

  @override
  bool shouldRepaint(CircleBlurPainter oldDelegate) {
    return true;
  }

  @override
  bool hitTest(Offset position) {
    double currentPosition = 0;
    for (int i = 0; i < this.colors.length; i++) {
      currentPosition += padding;
      Rect rect = Rect.fromLTRB(
          currentPosition, 0, currentPosition + this.circleWidth, 30);
      if (rect.contains(position)) {
        this.selectedColor = i;
        callback(this.selectedColor);
        return true;
      }
      if (i + 1 != this.colors.length) {
        currentPosition += circleWidth;
      }
    }
    return false;
  }

  @override
  bool shouldRebuildSemantics(CircleBlurPainter oldDelegate) => false;
}
