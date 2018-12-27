import 'dart:math';

import 'package:flutter/material.dart';

class CircleBlurPainter extends CustomPainter {

  CircleBlurPainter({@required this.circleWidth, @required this.color, this.selected});

  final double circleWidth;
  final Color color;
  bool selected = false;

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("Size Height: " + size.height.toString() + " Width: " + size.width.toString());
    if(selected) {
      Paint innerPaint = new Paint()
        ..color = color
        ..style = PaintingStyle.fill;
      Offset center = new Offset(circleWidth / 2, circleWidth / 2);
      double radius = min(circleWidth / 2, circleWidth / 2);
      canvas.drawCircle(center, radius, innerPaint);
     } else {
      Paint blurPaint = new Paint()
        ..color = color
        ..style = PaintingStyle.fill
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5.0);
      Offset center = new Offset(90 / 100 * circleWidth / 2, 90 / 100 * circleWidth / 2);
      double radius = min(circleWidth / 2, circleWidth / 2);
      canvas.drawCircle(center, radius, blurPaint);
      Paint innerPaint = new Paint()
        ..color = color
        ..style = PaintingStyle.fill;
      center = new Offset(circleWidth / 2, circleWidth / 2);
      radius = min(70 / 100 * circleWidth / 2, 70 / 100 * circleWidth / 2);
      canvas.drawCircle(center, radius, innerPaint);
    }
  }

  @override
  bool shouldRepaint(CircleBlurPainter oldDelegate) {
    return oldDelegate.selected != this.selected;
  }

  @override
  bool hitTest(Offset position) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(CircleBlurPainter oldDelegate) => true;

}
