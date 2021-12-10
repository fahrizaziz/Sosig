import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sosig/model/article.dart';
import 'package:sosig/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Article article;
  const DetailPage(
    this.article, {
    Key? key,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('dd MMM yyyy').format(
      widget.article.publishedAt!,
    );
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF373737).withOpacity(0.25),
                          offset: const Offset(0, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 29,
              ),
              height: 196,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(
                    widget.article.urlToImage!,
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF373737).withOpacity(0.2),
                    offset: const Offset(0, 5),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),
              child: Text(
                widget.article.title!,
                textAlign: TextAlign.justify,
                maxLines: 2,
                style: titleTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF373737).withOpacity(0.25),
                          offset: const Offset(0, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF021638),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    widget.article.author!,
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    style: personTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    formattedTime,
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    style: personTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                  ),
                  Text(
                    widget.article.description!,
                    textAlign: TextAlign.justify,
                    style: titleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 29,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  final url = widget.article.url;

                  if (await canLaunch(url!)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                      forceWebView: true,
                      enableJavaScript: true,
                    );
                  }
                },
                child: Text(
                  'Read More',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
