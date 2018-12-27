import 'package:flutter/material.dart';
import 'circle_blur_painter.dart';

class BlurWidget extends StatefulWidget {
  BlurWidget();

  @override
  BlurState createState() => new BlurState();
}

class BlurState extends State<BlurWidget> {

  BlurState() {
    debugPrint("constructor called 1");
    this.colors.add(Color(int.parse("FF2ADDB1", radix: 16)));
    this.colors.add(Color(int.parse("FF69E6FA", radix: 16)));
    this.colors.add(Color(int.parse("FF7070B5", radix: 16)));
    this.colors.add(Color(int.parse("FFFFC570", radix: 16)));
    this.colors.add(Color(int.parse("FFF68EDA", radix: 16)));
    this.colors.add(Color(int.parse("FFFF5C61", radix: 16)));
  }

  List<Color> colors = new List();
  int selectedColor = 2;

  void onColorSelected(int changedColor) {
    debugPrint("On color selected: " + changedColor.toString());
    setState(() {
      this.selectedColor = changedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: CircleBlurPainter(circleWidth: 25,
            colors: this.colors,
            callback: onColorSelected,
            selectedColor: selectedColor),
        size: Size(335, 30));
  }
}
