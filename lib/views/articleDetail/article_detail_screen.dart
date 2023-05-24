import 'package:articles/utils/network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/popular_article_model.dart';
import '../../utils/constants.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({
    Key? key,
    required this.popularArticleModel,
  }) : super(key: key);
  final Result popularArticleModel;

  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;
    double kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.whiteColor.withOpacity(0.95),
      body: SafeArea(
        child: Container(
          height: kHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          width: kWidth,
          child: ListView(
            children: [
              Text(
                popularArticleModel.title,
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: MyColors.greyColor,
                    size: 16,
                  ),
                  Text(
                    ' Updated At ${popularArticleModel.updated.toString().split(" ")[0]}',
                    style: MyFontStyle.kFontStyle.merge(
                      TextStyle(
                          fontSize: 12,
                          color: MyColors.greyColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.watch_later_outlined,
                    color: MyColors.greyColor,
                    size: 16,
                  ),
                  Text(
                    ' ${popularArticleModel.updated.toString().split(" ")[1].split(".")[0]}',
                    style: MyFontStyle.kFontStyle.merge(
                      TextStyle(
                          fontSize: 12,
                          color: MyColors.greyColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  popularArticleModel.media.isEmpty
                      ? CircleAvatar(
                          radius: 20,
                          backgroundColor: MyColors.greyColor,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: MyColors.whiteColor,
                          ),
                        )
                      : NetworkImageForArticles(
                          imageUrl: popularArticleModel
                              .media.first.mediaMetadata.first.url,
                          radius: 20,
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: kWidth * 0.7,
                    child: Text(
                      popularArticleModel.byline,
                      maxLines: 3,
                      style: MyFontStyle.kFontStyle.merge(
                        const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              if (popularArticleModel.media.isNotEmpty &&
                  popularArticleModel.media.first.caption.isNotEmpty)
                Text(
                  'Caption',
                  style: MyFontStyle.kFontStyle.merge(
                    const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              if (popularArticleModel.media.isNotEmpty &&
                  popularArticleModel.media.first.caption.isNotEmpty)
                const SizedBox(
                  height: 5,
                ),
              if (popularArticleModel.media.isNotEmpty &&
                  popularArticleModel.media.first.caption.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    popularArticleModel.media.first.caption,
                    style: MyFontStyle.kFontStyle.merge(
                      const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              if (popularArticleModel.media.isNotEmpty &&
                  popularArticleModel.media.first.caption.isNotEmpty)
                const Divider(
                  thickness: 1,
                ),
              Text(
                'Abstract',
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '" ${popularArticleModel.resultAbstract} "',
                  style: MyFontStyle.kFontStyle.merge(
                    const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Text(
                'Published date',
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                popularArticleModel.publishedDate.toString().split(" ")[0],
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Source',
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                popularArticleModel.source.name,
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Section',
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                popularArticleModel.section,
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              if (popularArticleModel.subsection.isNotEmpty)
                const SizedBox(
                  height: 5,
                ),
              if (popularArticleModel.subsection.isNotEmpty)
                Text(
                  'Sub-section',
                  style: MyFontStyle.kFontStyle.merge(
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              if (popularArticleModel.subsection.isNotEmpty)
                Text(
                  popularArticleModel.subsection,
                  style: MyFontStyle.kFontStyle.merge(
                    const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Keywords',
                style: MyFontStyle.kFontStyle.merge(
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              for (var item in popularArticleModel.desFacet)
                Text(
                  item,
                  style: MyFontStyle.kFontStyle.merge(
                    const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
