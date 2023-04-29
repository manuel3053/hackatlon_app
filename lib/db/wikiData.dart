final String tableWiki = 'articles';

class ArticlesFields {
  static final List<String> values = [
    /// Add all fields
    id, title, body
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String body = 'body';
}

class Article {
  final int? id;
  final String title;
  final String body;

  const Article({
    this.id,
    required this.title,
    required this.body,
  });
  static Article fromJson(Map<String, Object?> json) => Article(
        id: json[ArticlesFields.id] as int?,
        title: json[ArticlesFields.title] as String,
        body: json[ArticlesFields.body] as String,
      );

  Map<String, Object?> toJson() => {
        ArticlesFields.id: id,
        ArticlesFields.title: title,
        ArticlesFields.body: body,
      };

  Article copy({
    int? id,
    String? title,
    String? body,
  }) =>
      Article(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );
}