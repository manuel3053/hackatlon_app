import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackatlon_app/Data/globals.dart';

import '../db/wikiData.dart';

class ReadArticle extends StatelessWidget {
  final Article article;
  const ReadArticle({super.key, required this.article});
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
            Text('Notizia bombastica'),
            Text(article.body)
          ],
        ),
      ),
    );
  }
}
