import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FancyButton extends StatelessWidget {
  FancyButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: Colors.deepOrangeAccent,
        splashColor: Colors.yellow,
        onPressed: onPressed,
        shape: StadiumBorder(),
        textStyle: TextStyle(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 8.0
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.shop,
                  color: Colors.amber),
              SizedBox(width: 10.0),
              Text("PURCHAASE"),
            ],
          ),
        ));
  }
}
