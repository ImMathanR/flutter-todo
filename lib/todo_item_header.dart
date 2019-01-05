import 'package:flutter/material.dart';
import 'single_circle_blur_widget.dart';

class TodoItemHeader extends StatefulWidget {

  @override
  TodoItemView createState() => new TodoItemView();

}

abstract class TodoItemViewModel extends State<TodoItemHeader> {

  Widget _circleBlurWidget() {
    return CustomPaint(
        painter: SingleCircleBlurWidget(
            circleWidth: 20, backGroundColor: Color(int.parse("FF373749", radix: 16)), selectedColor: Colors.red),
        size: Size(30, 30));
  }

}

class TodoItemView extends TodoItemViewModel {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _circleBlurWidget(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: Text("Hello",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
              ),
            ],
          )
        ],
      ),
    );
  }

}