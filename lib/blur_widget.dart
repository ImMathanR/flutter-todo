import 'package:flutter/material.dart';
import 'circle_blur_painter.dart';

class BlurWidget extends StatefulWidget {

  BlurWidget();

  @override
  BlurState createState() => new BlurState();
}

class BlurState extends State<BlurWidget> {

  BlurState();

  bool selected = false;

  void changeColor() {
    setState(() {
      this.selected = !this.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        child: CustomPaint(painter: CircleBlurPainter(
            circleWidth: 30, color: Colors.amber, selected: this.selected),
        size: Size(30, 30)),
        onTap: changeColor,
      );
  }

}
