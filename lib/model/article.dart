// class Article {
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   DateTime? publishedAt;
//   String? content;
//   Article({
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });
//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//         author: json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//       );
// }

// class ArticleResult {
//   String? status;
//   int? totalResults;
//   List<Article>? articles;

//   ArticleResult({
//     this.status,
//     this.totalResults,
//     this.articles,
//   });
//   factory ArticleResult.fromJson(Map<String, dynamic> json) => ArticleResult(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from((json["articles"] as List)
//             .map((x) => Article.fromJson(x))
//             .where((article) =>
//                 article.author != null &&
//                 article.urlToImage != null &&
//                 article.publishedAt != null &&
//                 article.content != null)),
//       );
// }

import 'package:sosig/model/source.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  Article({
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.source,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  Article.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    author = json['author'] ?? '';
    title = json['title'] == null ? null : json['title'] ?? 'null';
    description = json['description'] ?? 'null';
    url = json['url'] ?? 'null';
    urlToImage = json['urlToImage'] ??
        'https://www.btklsby.go.id/images/placeholder/basic.png';
    publishedAt = DateTime.parse(json['publishedAt']);

    content = json['content'] ?? 'null';
  }
  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt!.toIso8601String(),
      'content': content,
    };
  }
}
