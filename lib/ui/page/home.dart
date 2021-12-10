import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sosig/provider/article_provider.dart';
import 'package:sosig/provider/category_article_provider.dart';
import 'package:sosig/shared/theme.dart';
import 'package:sosig/ui/widget/card_news.dart';
import 'package:sosig/ui/widget/card_newscategory.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryArticle? category;
  bool error = false;
  bool loading = true;
  fetchCatgeory() {
    category!.getNews().then((value) {
      setState(() {
        loading = false;
      });
    }).catchError((e) {
      setState(() {
        error = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) => fetchCatgeory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    category = Provider.of<CategoryArticle>(context);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              news(context),
            ],
          ),
        ),
      ),
    );
  }

  Container news(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Headline',
            style: headerTextStyle.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<ArticleProvider>(
            builder: (context, value, child) => FutureBuilder(
              future: Provider.of<ArticleProvider>(context, listen: false)
                  .getArticles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  var articles = value.getArticle;
                  return CarouselSlider.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index, realIndex) {
                      var article = articles[index];
                      return CardNews(article);
                    },
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(
                        seconds: 3,
                      ),
                      autoPlayAnimationDuration: const Duration(
                        microseconds: 800,
                      ),
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                    ),
                  );
                } else {
                  return const Text('Gagal');
                }
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category',
                  style: headerTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: category!.category.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          category!.setCategory(category!.category[index]);
                          setState(() {
                            loading = true;
                          });
                          fetchCatgeory();
                        },
                        child: Container(
                          height: 64,
                          width: 160,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              category!.category[index],
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: (category!.currentCategory ==
                                        category!.category[index])
                                    ? backgroundCategory
                                    : Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: (category!.currentCategory ==
                                    category!.category[index])
                                ? Colors.white
                                : backgroundCategory,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: SizedBox(
              width: 500,
              height: 500,
              child: (!loading)
                  ? SizedBox(
                      child: ListView(
                        children: List.generate(
                          category!.news.length,
                          (index) => SizedBox(
                            height: 300,
                            width: 240,
                            child: CardNewsCategory(
                              title: category!.news[index].title,
                              author: category!.news[index].source!.name,
                              imageURL: category!.news[index].urlToImage,
                              publishDate: category!.news[index].publishedAt,
                              index: index,
                              url: category!.news[index].url,
                              category: category!.currentCategory,
                            ),
                          ),
                        ),
                      ),
                    )
                  : ((error)
                      ? const Center(
                          child: Text("Error occured"),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        )),
            ),
          ),
        ],
      ),
    );
  }
}

Container header() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 44,
          width: 42,
          child: Image.asset(
            'assets/logo.png',
          ),
        ),
        Text(
          'sosig'.toUpperCase(),
          style: headerTextStyle.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        Container(),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.search,
        //   ),
        // ),
      ],
    ),
  );
}
// }
