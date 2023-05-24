import 'package:articles/model/popular_article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../views/articleDetail/article_detail_screen.dart';
import 'constants.dart';
import 'network_image.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({Key? key, required this.popularArticle}) : super(key: key);
  final Result popularArticle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 10,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ArticleDetailScreen(
                      popularArticleModel: popularArticle);
                },
              ),
            );
          },
          leading: popularArticle.media.isEmpty
              ? CircleAvatar(
                  radius: 35,
                  backgroundColor: MyColors.greyColor,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: MyColors.whiteColor,
                  ),
                )
              : NetworkImageForArticles(
                  imageUrl: popularArticle.media.first.mediaMetadata.first.url,
                  radius: 35,
                ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          title: Text(
            popularArticle.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: MyFontStyle.kFontStyle.merge(
              const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  popularArticle.byline,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyFontStyle.kFontStyle.merge(
                    const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: MyColors.greyColor,
                    size: 18,
                  ),
                  Text(
                    " ${popularArticle.publishedDate.toString().split(" ")[0]}",
                    style: MyFontStyle.kFontStyle.merge(
                      const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          ),
          horizontalTitleGap: 0,
        ),
        const Divider(),
      ],
    );
  }
}
