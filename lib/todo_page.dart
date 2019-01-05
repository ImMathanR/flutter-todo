import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'resources.dart';
import 'todo_app_bar.dart';
import 'todo_item_header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoApp extends StatefulWidget {
  @override
  TodoAppView createState() => new TodoAppView();
}

abstract class TodoAppViewModel extends State<TodoApp> {
  int number = 0;

  void incrementVote(DocumentSnapshot document) {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnapshot = await transaction.get(document.reference);
      await transaction.update(freshSnapshot.reference, {
        "votes": freshSnapshot["votes"] + 1,
      });
    });
  }

  Widget getListItem(BuildContext buildContext, DocumentSnapshot document) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(document["name"],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
            ),
            RaisedButton(
              onPressed: () {
                incrementVote(document);
              },
              textColor: Colors.white,
              color: Colors.red,
              child: Text(document["votes"].toString()),
            ),
          ],
        ),
      ),
    );
  }

  @protected
  Text getName() {
    final WordPair wordPair = WordPair.random();
    return new Text(wordPair.asPascalCase);
  }

  void colorCallback() {
    setState(() {});
  }

  void add() {
    setState(() {
      number++;
    });
  }
}

class TodoAppView extends TodoAppViewModel {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          primaryColor: TodoColors.headerAppBarColor,
          fontFamily: TodoFonts.quickSand),
      home: new Scaffold(
          backgroundColor: TodoColors.backgroundColor,
          body: Column(
            children: <Widget>[
              TodoAppBar(
                  title: "YOUR TODOS", color: TodoColors.headerAppBarColor),
              TodoItemHeader(),
              Container(
                height: 240,
                child: StreamBuilder(
                  stream: Firestore.instance.collection("dognames").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading...");
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) => getListItem(
                            context, snapshot.data.documents[index]));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
