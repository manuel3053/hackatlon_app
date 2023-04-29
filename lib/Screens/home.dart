import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Wiki'),
      ),
    ),
    SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Trivia'),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        padding: EdgeInsets.all(8),
        crossAxisCount: 3,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        children: gridItems
      ),
    );
  }
}
