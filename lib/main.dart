import 'package:flutter/material.dart';
import 'package:multiple_choice_questions/answer.dart';
import 'package:multiple_choice_questions/quiz.dart';
import 'package:multiple_choice_questions/result.dart';

import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1},
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 20},
        {"text": "Dog", "score": 2},
        {"text": "Lion", "score": 3},
        {"text": "Cat", "score": 3},
      ]
    },
    {
      "questionText": "Who is your Favorite Programmer?",
      "answers": [
        {"text": "Ilo", "score": 50},
        {"text": "Bill", "score": 5},
        {"text": "Gate", "score": 12},
        {"text": "Belvi", "score": 30},
      ]
    }
  ];
  int _totalScore = 0;
  int _questionIndex = 0;
  void _answerQuestion(int score) {

    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

 void _resetQuiz(){

   /***
    * This will retrigger the build method
    */
   setState(() {
      _totalScore= 0;
      _questionIndex = 0;
    });

}

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exam Practice")),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
