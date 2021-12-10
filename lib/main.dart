import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sosig/provider/article_provider.dart';
import 'package:sosig/provider/category_article_provider.dart';
import 'package:sosig/ui/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArticleProvider(
              // newService: NewService(),
              ),
        ),
        ChangeNotifierProvider.value(
          value: CategoryArticle(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
