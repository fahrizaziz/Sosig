import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sosig/model/category.dart';
import 'package:sosig/model/result_category.dart';
import 'package:sosig/shared/shared.dart';

class CategoryArticle with ChangeNotifier {
  List<Category> _news = [];
  String _currentCategory = 'General';
  List<Category> get news {
    return [..._news];
  }

  String get currentCategory {
    return _currentCategory;
  }

  setCategory(String category) {
    _currentCategory = category;
    notifyListeners();
  }

  List<String> category = [
    'General',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  Future<List<Category>> getNews() async {
    var url =
        'http://newsapi.org/v2/top-headlines?country=id&category=$_currentCategory&apiKey=$apiKey';

    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        var newsModel = ResultCategory.fromJson(jsonMap);
        final List<Category>? loadednews = newsModel.articles;
        _news = loadednews!;
      }
      notifyListeners();
    } catch (e) {
      throw e.toString();
    }

    return _news;
  }

  Category findByIndex(int index) {
    return _news[index];
  }
}
