import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultText {
    String text = '';
    if (totalScore < 1000) {
      text = 'Youar amaizing ' + totalScore.toString();
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultText,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: resetQuiz,
          child: Text("reset quiz"),
        )
      ],
    ));
  }
}
