// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hackatlon_app/Data/constants.dart';
import 'package:hackatlon_app/Data/globals.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Missions extends StatefulWidget {
  const Missions({
    super.key,
  });

  @override
  State<Missions> createState() => _MissionsState();
}

class _MissionsState extends State<Missions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(187, 255, 255, 255),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    "Short Term",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                linearProgressor(x: 9, y: 10, text: "Passa Fisica"),
                linearProgressor(x: 9, y: 10, text: "Passa Fisica"),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Altro",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    )),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(187, 255, 255, 255),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Long Term",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                  linearProgressor(x: 9, y: 10, text: "Passa Fisica"),
                  linearProgressor(x: 9, y: 10, text: "Passa Fisica"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Altro",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class linearProgressor extends StatelessWidget {
  final int x, y;
  final String text;
  const linearProgressor(
      {super.key, required this.x, required this.y, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: LinearPercentIndicator(
        width: getWidth(context) / 1.6,
        animation: true,
        lineHeight: 20.0,
        animationDuration: 2000,
        leading: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),
        percent: x / y,
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: barColour,
        backgroundColor: const Color.fromARGB(85, 0, 0, 0),
      ),
    );
  }
}
