// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hackatlon_app/Data/constants.dart';
import 'package:hackatlon_app/Data/globals.dart';
import 'package:hackatlon_app/Functions/triviaLogic.dart';
import 'package:hackatlon_app/Screens/quizpage.dart';
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: barBackColour,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    circularBar(
                        x: 4,
                        y: 5,
                        middleText: "4/5",
                        underText: "Lessons",
                        colour: barColour),
                    circularBar(
                        x: 9,
                        y: 10,
                        middleText: "9km",
                        underText: "Walks",
                        colour: barColour),
                    circularBar(
                        x: 7,
                        y: 10,
                        middleText: "7/10",
                        underText: "Trivia",
                        colour: barColour),
                  ],
                ),
              ],
            ),
          ),
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuizPage()));
                },
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              settingCard(text: "Reward", onTap: () {}),
              settingCard(text: "Badge", onTap: () {}),
              settingCard(text: "Community", onTap: () {}),
            ],
          )
        ]),
        SizedBox(
          height: 15,
        )
      ]),
    );
  }
}

class settingCard extends StatelessWidget {
  final String text;
  final Function() onTap;
  const settingCard({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Container(
          width: getWidth(context) / 1.2,
          height: getHeight(context) / 15,
          decoration: BoxDecoration(
            color: barBackColour,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          )),
        ),
      ),
    );
  }
}

class circularBar extends StatelessWidget {
  final int x, y;
  final String middleText, underText;
  final Color colour;
  const circularBar(
      {super.key,
      required this.x,
      required this.y,
      required this.middleText,
      required this.underText,
      required this.colour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 40,
            lineWidth: 15,
            percent: x / y,
            progressColor: colour,
            animation: true,
            animationDuration: 1500,
            center: Text(middleText),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(underText),
          )
        ],
      ),
    );
  }
}
