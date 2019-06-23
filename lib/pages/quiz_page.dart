import 'package:flutter/material.dart';
import 'quiz_page_question.dart';

class QuizPage extends StatelessWidget {
  String title = "Quiz";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Center(
        child: new Material(
          color: Colors.greenAccent,
          child: new InkWell(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new QuizPageQuestion(),
                  ),
                ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Let Quizzzz",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold),
                ),
                new Text(
                  "Tap to start!",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
