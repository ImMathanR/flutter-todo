import 'package:flutter/material.dart';

class SingleCircleBlurWidget extends CustomPainter {

  SingleCircleBlurWidget(
      {@required this.circleWidth, @required this.backGroundColor, this.selectedColor});

  final double circleWidth;
  Color selectedColor;
  final Color backGroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint blurPaint = new Paint()
      ..color = selectedColor
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10.0);
    Offset center = new Offset(
        circleWidth / 2, circleWidth / 2);
    double radius = 80 / 100 * circleWidth / 2;
    canvas.drawCircle(center, radius, blurPaint);
    Paint innerPaint = new Paint()
      ..color = selectedColor
      ..style = PaintingStyle.fill;
    center = new Offset(circleWidth / 2, circleWidth / 2);
    radius = 60 / 100 * circleWidth / 2;
    canvas.drawCircle(center, radius, innerPaint);
    Paint whitePaint = new Paint()
      ..color = backGroundColor
      ..strokeWidth = circleWidth
      ..blendMode = BlendMode.src
      ..style = PaintingStyle.stroke;
    center = new Offset(circleWidth / 2, circleWidth / 2);
    radius = circleWidth;
    canvas.drawCircle(center, radius, whitePaint);
  }

  @override
  bool shouldRepaint(SingleCircleBlurWidget oldDelegate) {
    return oldDelegate.selectedColor != this.selectedColor;
  }

}