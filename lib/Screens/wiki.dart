// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hackatlon_app/Screens/addEditArticle.dart';
import 'package:hackatlon_app/Screens/viewArticle.dart';
import 'package:hackatlon_app/db/database.dart';
import 'package:hackatlon_app/db/wikiData.dart';

import '../Widgets/info.dart';

class Wiki extends StatefulWidget {
  const Wiki({
    super.key,
  });

  @override
  State<Wiki> createState() => _WikiState();
}

class _WikiState extends State<Wiki> {
  late List<Article> articles;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    articles = await ArticlesDatabase.instance.readAllArticles();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        "Players",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16)),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await Navigator.of(context).push(
                                //AddEditNotePage
                                MaterialPageRoute(
                                    builder: (context) => addEditArticle()),
                              );

                              refreshNotes();
                            },
                          ),
                        ),
                      ),
                    )),
                isLoading
                    ? CircularProgressIndicator()
                    : articles.isEmpty
                        ? Text(
                            'No articles',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                            textAlign: TextAlign.center,
                          )
                        : sfondo(),
                //buildPlayers(),sfondo(),
                SizedBox(
                  height: 20,
                ),
              ],
            )));
  }

  Widget sfondo() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];

                return GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => viewArticle(article: article),
                    ));
                    refreshNotes();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: infoCard(title: article.title),
                  ),
                  //child: PlayerCardWidget(player: player, index: index),
                );
              }),
        ),
      );
}
