import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// this is the way to import a package
void main() => runApp(MyApp());

// the class should name MyApp
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final _questions = const [
    {
      "question": "Que color?",
      "answer": [
        {"text": "black", "score": 10},
        {"text": "green", "score": 40},
        {"text": "blue", "score": 50},
        {"text": "yellow", "score": 100},
      ],
    },
    {
      "question": "Que clima estuvo hoy?",
      "answer": [
        {"text": "black", "score": 10},
        {"text": "green", "score": 40},
        {"text": "blue", "score": 50},
        {"text": "yellow", "score": 100},
      ],
    },
    {
      "question": "Que piensas hoy?",
      "answer": [
        {"text": "black", "score": 10},
        {"text": "green", "score": 40},
        {"text": "blue", "score": 50},
        {"text": "yellow", "score": 100},
      ],
    },
  ];

  int _totalScore = 0;

  void _answerdQuestion(int score) {
    _totalScore += score;
    setState(() => _questionIndex = _questionIndex + 1);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // take a buildcontext as a argument, is conext an is a especial type of
  // object, and this return a widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App bar"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerdQuestion: _answerdQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                _totalScore,
                _resetQuiz,
              ),
      ),
    );
  }
}
