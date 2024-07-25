import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String textAnswer;
  final void Function() answered;

  const Answers(this.textAnswer, this.answered, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: answered,
        child: Text(textAnswer),
      ),
    );
  }
}
