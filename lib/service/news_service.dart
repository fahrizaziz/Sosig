import 'dart:convert';

import 'package:http/http.dart';
import 'package:sosig/model/article.dart';
import 'package:sosig/shared/shared.dart';

class NewService {
  // Future<ArticleResult> getNews() async {
  //   var url = '$baseUrl/top-headlines?country=id&apiKey=$apiKey';
  //   var response = await get(
  //     Uri.parse(url),
  //   );
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     return ArticleResult.fromJson(jsonDecode(data));
  //   } else {
  //     throw Exception('Failed to load top headlines');
  //   }
  // }

  Future<List<Article>> getNews() async {
    var url = baseUrl + 'top-headlines?country=id&apiKey=$apiKey';
    // print(url);
    var response = await get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];
      // print(data);
      List<Article> article = [];
      for (var item in data) {
        article.add(Article.fromJson(item));
      }
      return article;
    } else {
      throw Exception('Gagal Article!');
    }
  }
}
