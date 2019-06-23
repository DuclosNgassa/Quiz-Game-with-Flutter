import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool answer;
final VoidCallback _onTap;

  AnswerButton(this.answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Expanded(
      // True Button
      child: new Material(
        color: answer == true ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
              ),
              padding: new EdgeInsets.all(20.0),
              child: new Text(
                answer == true ? "True" : "False",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
