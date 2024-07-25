import 'package:flutter/material.dart';
import 'answers.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int actualQuestion;
  final void Function(int) answered;

  Quiz({
    required this.questions,
    required this.actualQuestion,
    required this.answered,
  });

  bool get haveQuestion {
    return actualQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,Object>> answersList = haveQuestion
        ? questions[actualQuestion]['answers'] as List<Map<String,Object>>
        : [];

    return Column(
      children: <Widget> [
        Question(questions[actualQuestion]['questions'] as String),
        ...answersList.map(
          (ans) => Answers(ans['text'] as  String,
          () => answered(ans['point'] as int))
        )
      ],
    );
                
  }
}