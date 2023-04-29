import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackatlon_app/Data/globals.dart';

class Info extends StatelessWidget {
  final String title;
  const Info({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(image: AssetImage('images/bg.png')),
            Text(title),
          ],
        ),
      ),
    );
  }
}
