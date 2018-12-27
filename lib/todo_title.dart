import 'package:flutter/material.dart';
import 'todo_title_view.dart';
import 'package:flutter/foundation.dart';

class TodoTitle extends StatefulWidget {

  @override
  State<TodoTitle> createState() => new TodoTileWidget();

}

abstract class TodoTileWidgetViewModel extends State<TodoTitle> {

  bool selected = false;

  void changeColors() {
    debugPrint("Clicked");
    setState(() {
      selected = !selected;
    });
  }

}