import 'package:flutter/material.dart';
import 'package:sosig/model/article.dart';
import 'package:sosig/shared/theme.dart';
import 'package:sosig/ui/page/detail.dart';

class CardNews extends StatelessWidget {
  final Article article;
  // final String? title;
  const CardNews(
    this.article, {
    Key? key,
    // this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(article),
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(
          10,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(
                    article.urlToImage!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(
                      0.8,
                    ),
                    Colors.white.withOpacity(
                      0.1,
                    ),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [
                    0.1,
                    0.9,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: headernewsTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      article.source!.name!,
                      style: subheadernewsTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.all(15),
    //   padding: const EdgeInsets.all(15),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Expanded(
    //         child: Container(
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: NetworkImage(article.urlToImage!),
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Text(
    //         article.title!,
    //         // title!,
    //       ),
    //     ],
    //   ),
    // );
  }
}
