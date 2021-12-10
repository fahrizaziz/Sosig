import 'dart:convert';

import 'package:sosig/model/category.dart';

ResultCategory resultFromJson(String str) => ResultCategory.fromJson(
      jsonDecode(str),
    );
String resultToJson(ResultCategory data) => jsonEncode(
      data.toJson(),
    );

class ResultCategory {
  String? status;
  int? totalResults;
  List<Category>? articles;
  ResultCategory({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory ResultCategory.fromJson(Map<String, dynamic> json) => ResultCategory(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Category>.from(
            json["articles"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}
