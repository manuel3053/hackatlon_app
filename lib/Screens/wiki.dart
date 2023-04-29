import 'package:flutter/material.dart';
import 'package:hackatlon_app/Screens/addEditArticle.dart';
import 'package:hackatlon_app/Screens/readarticle.dart';
import 'package:hackatlon_app/Widgets/userbar.dart';
import 'package:hackatlon_app/db/database.dart';

import '../Widgets/info.dart';
import '../db/wikiData.dart';

class Wiki extends StatefulWidget {
  const Wiki({
    super.key,
  });

  @override
  State<Wiki> createState() => _WikiState();
}

class _WikiState extends State<Wiki> {
  late List<Article> articles;

  @override
  void initState(){
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async{
    articles=await ArticlesDatabase.instance.readAllArticles();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<Article>?>(
            future: ArticlesDatabase.instance.readAllArticles(),
            builder: (context, AsyncSnapshot<List<Article>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return Center(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: articles.isEmpty ? snapshot.data!.length : articles.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ReadArticle(article: snapshot.data![i])));
                              }, // funzione per modificare la nota
                              child: Info(
                                title: articles.isEmpty ? snapshot.data![i].title : articles[i].title,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int i) =>
                        const Divider(
                          thickness: 0,
                        ),
                      ));
                }
              }
              return const Center(child: Text('No Articles'));
            },
          ),
        ),
        floatingActionButton: ElevatedButton(
          child: Text('Add'),
          onPressed: (){Navigator.push(context,
              MaterialPageRoute(builder: (context) => addEditArticle()));
            refreshNotes();
            },
        ),
      ),
    );
  }
}
