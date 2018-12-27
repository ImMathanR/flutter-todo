import 'package:flutter/material.dart';
import './todo_page.dart';
import 'fancy_button.dart';
import 'app_bar_clipper.dart';
import 'todo_title_view.dart';
import 'todo_title.dart';

class TodoAppView extends TodoAppViewModel {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Color(int.parse("FF7070B5", radix: 16)),
        fontFamily: 'Quicksand'
      ),
      home: new Scaffold(
        body: Column(
          children: <Widget>[
            AppBar(
              title: Text("YOUR LISTS"),
              centerTitle: true,
            ),
            ClipPath(
              child: Container(
                height: 35,
                color: Color(int.parse("FF7070B5", radix: 16)),
              ),
              clipper: AppBarClipper(),
            ),
            TodoTitle()
          ],
        )
      ),
    );
  }

}