import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackatlon_app/db/wikiData.dart';

class viewArticle extends StatelessWidget {
  final Article article;
  viewArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(article.title ?? 'sad'), Text(article.body ?? 'sad')],
      ),
    );
  }
}
