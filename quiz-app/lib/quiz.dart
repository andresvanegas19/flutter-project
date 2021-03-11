import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerdQuestion;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  Quiz({
    @required this.answerdQuestion,
    @required this.questions,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['question'],
        ),
        // ... take a list and add all value into this list
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((question) {
          return Answer(
              () => answerdQuestion(question["score"]), question['text']);
        }).toList()
      ],
    );
  }
}
