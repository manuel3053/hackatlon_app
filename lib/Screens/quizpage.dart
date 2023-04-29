import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hackatlon_app/Data/constants.dart';
import 'package:hackatlon_app/Functions/triviaLogic.dart';
import 'package:hackatlon_app/Widgets/quizCard.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Functions/domande.dart';
import '../Widgets/streak.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int level = 0;
  int score=0;
  List<Quiz> game = generateTrivia(4);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Text('Punteggio: $score')),
          quizCard(quiz: game[level], onCorrectAnswer: (value){
            setState(() {
              if(level<3){
                level++;
              }
              score=value;
            });
          },),
        ],
      ),
    );
  }
}
