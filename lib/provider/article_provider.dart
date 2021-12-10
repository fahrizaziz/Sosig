import 'package:flutter/material.dart';
import 'package:sosig/model/article.dart';
import 'package:sosig/service/news_service.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _article = [];
  List<Article> get getArticle => _article;

  set getArticle(List<Article> articles) {
    _article = articles;
    notifyListeners();
  }

  Future<void> getArticles() async {
    try {
      List<Article> articles = await NewService().getNews();
      _article = articles;
    } catch (e) {
      throw Exception(e);
    }
  }
}
