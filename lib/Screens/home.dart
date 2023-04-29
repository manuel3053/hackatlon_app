// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hackatlon_app/Functions/triviaLogic.dart';
import 'package:hackatlon_app/Widgets/quizCard.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Functions/domande.dart';
import '../Widgets/streak.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int level = 0;
  List<Quiz> game = generateTrivia(4);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircularPercentIndicator(
              radius: 60,
              lineWidth: 15,
              percent: 60 / 100,
              progressColor: Colors.red,
              animation: true,
              animationDuration: 1500,
              center: Text('00%'),
            ),
            CircularPercentIndicator(
              radius: 60,
              lineWidth: 15,
              percent: 60 / 100,
              progressColor: Colors.red,
              animation: true,
              animationDuration: 1500,
              center: Text('00% '),
            ),
            CircularPercentIndicator(
              radius: 60,
              lineWidth: 15,
              percent: 60 / 100,
              progressColor: Colors.red,
              animation: true,
              animationDuration: 1500,
              center: Text('00%'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  'Wiki',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomPaint(
                    painter: Streak(),
                    child: Container(
                        height: 90,
                        width: 70,
                        child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star),
                                Text('120'),
                              ],
                            ))))),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  'Trivia',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
