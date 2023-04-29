// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hackatlon_app/Functions/triviaLogic.dart';
import 'package:hackatlon_app/Widgets/quizCard.dart';
import '../Functions/domande.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int level = 0;
  int score = 0;
  List<Quiz> game = generateTrivia(4);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Text(
            'Score: $score',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
          quizCard(
            quiz: game[level],
            onCorrectAnswer: (value) {
              setState(() {
                if (level < 3) {
                  level++;
                } else {
                  Navigator.pop(context);
                }
                score = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
