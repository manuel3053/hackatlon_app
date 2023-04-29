import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({
    super.key,
  });

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard>{

  @override
  Widget build(BuildContext context) {
    return Container(
      /*child: ListView.builder(
          itemBuilder: itemBuilderà
      )*/
      child: Text('>Leaderboard'),
    );
  }
}