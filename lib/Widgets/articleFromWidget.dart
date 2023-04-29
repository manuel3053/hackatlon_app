import 'package:flutter/material.dart';

class ArticleFormWidget extends StatelessWidget {
  final String? title;
  //final String? image;
  final String? body;

  final ValueChanged<String> onChangedTitle;
  //final ValueChanged<String> onChangedImage;
  final ValueChanged<String> onChangedBody;

  ArticleFormWidget({
    Key? key,
    this.title = '',
    //this.image = '',
    this.body = '',
    required this.onChangedBody,
    required this.onChangedTitle,
    //required this.onChangedImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              const SizedBox(height: 8),
              //buildDescription(),
              const SizedBox(height: 16),
              buildBody()
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.red),
        ),
        validator: (title) {
          if (title != null) {
            if (title.isEmpty) {
              return 'The title cannot be empty!';
            } else if (title.length > 40) {
              return 'The title is too long (max 12 charaters)';
            } else {
              return null;
            }
          } else {
            return null;
          }
        },
        onChanged: onChangedTitle,
      );

  Widget buildBody() => TextFormField(
        maxLines: null,
        initialValue: title,
        style: const TextStyle(
          color: Color.fromARGB(187, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Body',
          hintStyle: TextStyle(color: Color.fromARGB(202, 0, 0, 0)),
        ),
        onChanged: onChangedBody,
      );
}
