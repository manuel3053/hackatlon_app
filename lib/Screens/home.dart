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

  List<Widget> gridItems = [
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
    Padding(
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text('Wiki'),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomPaint(
        painter: Streak(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(''),
              Text('Streak'),
              Text('n'),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: GridView.count(
          padding: EdgeInsets.all(8),
          crossAxisCount: 3,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 50.0,
          children: gridItems),
    );
  }
}
