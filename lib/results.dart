import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int points;
  final void Function() quizReboot;

  const Results(this.points, this.quizReboot, {super.key});

  String get resultText {
      if(points < 15) {
        return 'OPS... You need watch again! Your score is $points';
      } else if (points < 25) {
        return 'Ok! You are good... Your score is $points';
      } else {
        return 'Yeah!!! Congratulations, Potterhead! Your score is $points';
      }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
              resultText,
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
        ),
        TextButton(
          onPressed: quizReboot,
          child: const Text(
            'Do you want reboot the quiz?', 
            style: TextStyle(fontSize: 18),
            )
        )
      ],
    );
  }
}