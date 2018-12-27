import 'package:flutter/material.dart';
import 'todo_title.dart';
import 'blur_widget.dart';
import 'package:flutter/rendering.dart';

class TodoTileWidget extends TodoTileWidgetViewModel {
  TodoTileWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlurWidget(),
        )
      ]),
    );
  }
}
