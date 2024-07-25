import 'package:flutter/material.dart';
import 'package:questionario/data.dart';
import './results.dart';
import './quiz.dart';

main() => runApp(const QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _actualQuestion = 0;
  var _points = 0;

  final List<Map<String,Object>> _questions = Data().questions;

  void _answered(int point) {
    if(haveQuestion){
      setState(() {
        _actualQuestion++;
        _points += point;
      });
    }
  }

  void _quizReboot() {
    setState(() {
      _actualQuestion = 0;
      _points = 0;
    });
  }

  bool get haveQuestion {
    return _actualQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
        ),
        body: haveQuestion
            ? Quiz(questions: _questions, actualQuestion: _actualQuestion, answered: _answered)
            : Results(_points, _quizReboot),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
