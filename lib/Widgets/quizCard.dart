// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackatlon_app/Data/constants.dart';
import 'package:hackatlon_app/Data/globals.dart';
import 'package:hackatlon_app/Functions/domande.dart';

class quizCard extends StatefulWidget {
  final Quiz quiz;
  final Function onCorrectAnswer;
  const quizCard({Key? key, required this.quiz, required this.onCorrectAnswer})
      : super(key: key);

  @override
  State<quizCard> createState() => _quizCardState();
}

class _quizCardState extends State<quizCard> {
  int punteggio=0;
  @override
  Widget build(BuildContext context) {
    var quiz = widget.quiz;
    int len = quiz.answers.length;

    return Center(
        child: Column(
      children: [
        Container(
          width: getWidth(context) / 1.25,
          height: getHeight(context) / 1.5,
          padding: EdgeInsets.only(
            top: kDefaultPadding * 2,
            right: kDefaultPadding,
            left: kDefaultPadding,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 29, 43, 163),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: getHeight(context) / 5,
                  child: Text(
                    quiz.question,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListView.builder(
                          padding: EdgeInsets.all(1),
                          itemCount: len,
                          itemBuilder: (context, index) {
                            final option = quiz.answers[index];

                            return GestureDetector(
                              onTap: () {
                                if (index == quiz.solution) {
                                  print("Fatto");

                                  punteggio++;
                                  print(punteggio);

                                  widget.onCorrectAnswer(punteggio).value;
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 200,
                                    height: getHeight(context) / 10,
                                    padding: EdgeInsets.only(
                                      right: kDefaultPadding,
                                      left: kDefaultPadding,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 0, 255, 119),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Text(
                                        option,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                            );
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
