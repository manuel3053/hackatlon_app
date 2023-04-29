import 'package:flutter/material.dart';
import 'package:hackatlon_app/Widgets/userbar.dart';

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
      child: ListView.builder(
        itemCount: 1,
          itemBuilder: (BuildContext context, int i){
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: UserBar(),
              );
          }
      )
      //child: Text('>Leaderboard'),
    );
  }
}