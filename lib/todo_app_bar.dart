import 'package:flutter/material.dart';
import 'app_bar_clipper.dart';
import 'resources.dart';

class TodoAppBar extends StatelessWidget {

  TodoAppBar({@required this.title, @required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AppBar(
        title: Text(this.title),
        centerTitle: true,
        textTheme: TextTheme(
          title: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "QuickSand"
          )
        ),
      ),
      ClipPath(
        child: Container(
          height: 35,
          color: this.color,
        ),
        clipper: AppBarClipper(),
      ),
    ]);
  }
}
