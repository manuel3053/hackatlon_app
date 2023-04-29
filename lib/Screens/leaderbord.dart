import 'package:flutter/material.dart';
import 'package:hackatlon_app/Widgets/userbar.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({
    super.key,
  });

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
        child: ListView.separated(
      itemCount: 30,
      itemBuilder: (BuildContext context, int i) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: UserBar(),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(height: 2,);
      },
    )
        //child: Text('>Leaderboard'),
        );
  }
}
