import 'package:flutter/material.dart';
import './todo_page_view.dart';
import 'package:english_words/english_words.dart';

class TodoApp extends StatefulWidget {
  @override
  TodoAppView createState() => new TodoAppView();
}

abstract class TodoAppViewModel extends State<TodoApp> {

  int number = 0;
  
  @protected
  Text getName() {
    final WordPair wordPair = WordPair.random();
    return new Text(wordPair.asPascalCase);
  }

  void colorCallback() {
    setState(() {

    });
  }

  void add() {
    setState(() {
      number++;
    });
  }

}
