import 'dart:io';

import 'package:articles/controllers/get_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/article_tile.dart';
import '../../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GetArticleController getArticleController = GetArticleController();
  bool isLoading = true;
  String noInternetString = '';

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  getArticles() async {
    try {
      await getArticleController.getAllArticles();
    } catch (exception) {
      toastMessage('Something went wrong, try again!');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: AppBar(
        backgroundColor: MyColors.foregroundColor,
        leading: Icon(
          Icons.menu_rounded,
          color: MyColors.whiteColor,
        ),
        title: Text(
          "NY Times Most Popular",
          style: MyFontStyle.kFontStyle,
        ),
        actions: [
          Icon(
            Icons.search_rounded,
            color: MyColors.whiteColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_vert_rounded,
            color: MyColors.whiteColor,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: RefreshIndicator(
        color: MyColors.foregroundColor,
        onRefresh: () {
          setState(() {
            isLoading = true;
          });
          return getArticles();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? Center(child: progressIndicator)
                : Expanded(
                    child: ListView.builder(
                        itemCount: getArticleController
                            .popularArticleModel.results!.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var popularArticle = getArticleController
                              .popularArticleModel.results![index];
                          return ArticleTile(
                            popularArticle: popularArticle,
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
