import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sosig/shared/theme.dart';
import 'package:sosig/ui/page/detail_category.dart';

class CardNewsCategory extends StatefulWidget {
  final int? index;
  final String? title;
  final String? imageURL;
  final DateTime? publishDate;
  final String? author;
  final String? url;
  final String? category;
  const CardNewsCategory({
    Key? key,
    this.index,
    this.title,
    this.imageURL,
    this.publishDate,
    this.author,
    this.url,
    this.category,
  }) : super(key: key);

  @override
  _CardNewsCategoryState createState() => _CardNewsCategoryState();
}

class _CardNewsCategoryState extends State<CardNewsCategory> {
  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('dd MMM yyyy - HH:mm').format(
      widget.publishDate!,
    );
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailCategoryPage(
                index: widget.index!,
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    widget.imageURL!,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      12,
                    ),
                    topRight: Radius.circular(
                      12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 89,
                    horizontal: 14,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Text(
                          widget.category!,
                          style: headernewsTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: headernewsTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (widget.author != null && widget.author!.length < 25)
                  Text(
                    widget.author!,
                    style: subnewsTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: backgroundCategory,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    if (formattedTime.isNotEmpty)
                      Text(
                        formattedTime,
                        style: subnewsTextStyle.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
