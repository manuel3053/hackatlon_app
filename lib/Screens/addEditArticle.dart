// addArticle
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hackatlon_app/Widgets/articleFromWidget.dart';
import 'package:hackatlon_app/db/database.dart';
import 'package:hackatlon_app/db/wikiData.dart';

class addEditArticle extends StatefulWidget {
  final Article? article;

  const addEditArticle({
    Key? key,
    this.article,
  }) : super(key: key);
  @override
  _addEditArticleState createState() => _addEditArticleState();
}

class _addEditArticleState extends State<addEditArticle> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String body;
  //late String image;

  @override
  void initState() {
    super.initState();

    title = widget.article?.title ?? '';
    body = widget.article?.body ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(255, 172, 220, 140),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 33, 149, 243),
          elevation: 0,
          title: Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 6.5),
            child: Text(
              "Article",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: ArticleFormWidget(
            title: title,
            body: body,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedBody: (body) => setState(() => this.body = body),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid =
        //name.isNotEmpty && image.isNotEmpty && (name.length <= 12);
        title.isNotEmpty && (title.length <= 40);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : const Color.fromARGB(255, 97, 97, 97),
        ),
        onPressed: () {
          addOrUpdateNote();
        },
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.article != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final article = widget.article!.copy(
      title: title,
      body: body,
    );

    await ArticlesDatabase.instance.updateArticles(article);
  }

  Future addNote() async {
    final article = Article(
      title: title,
      body: body,
    );

    await ArticlesDatabase.instance.createArticle(article);
  }
}
