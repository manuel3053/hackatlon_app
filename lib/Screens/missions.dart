// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hackatlon_app/Data/constants.dart';
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
    final double progress = 0.5;
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
                color: Color.fromARGB(189, 16, 140, 132),
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
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: LinearPercentIndicator(
                    width: getWidth(context) / 1.6,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    leading: Text(
                      "Passa Fisica",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    percent: 0.9,
                    center: Text("90.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.greenAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: LinearPercentIndicator(
                    width: getWidth(context) / 1.6,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    leading: Text(
                      "Passa Fisica",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    percent: 0.9,
                    center: Text("90.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.greenAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Altro",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(189, 16, 140, 132),
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
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      width: getWidth(context) / 1.6,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      leading: Text(
                        "Passa Fisica",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      percent: 0.9,
                      center: Text("90.0%"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.greenAccent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      width: getWidth(context) / 1.6,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      leading: Text(
                        "Passa Fisica",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      percent: 0.9,
                      center: Text("90.0%"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.greenAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Altro",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
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
