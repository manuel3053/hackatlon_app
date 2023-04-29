import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('P°'),
          Text('Nickname'),
          Text('Streak'),
          Text('PT'),
        ],
      ),

    );
  }
}
