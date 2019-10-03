import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final totalScore;
  Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    String resultText = "You did it";
    if (totalScore < 8) {
      resultText = "You are Aweseom and Innocent";
    } else if (totalScore <= 12) {
      resultText = "Pretty Likable";
    } else if (totalScore <= 16) {
      resultText = "You are ...strange?";
    } else {
      resultText = "You are so bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(children: <Widget>[
      Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
          FlatButton(
            child: Text("Reset Quiz"),
            onPressed: resetHandler,
            textColor: Colors.blue,

          )
    ]));
  }
}
