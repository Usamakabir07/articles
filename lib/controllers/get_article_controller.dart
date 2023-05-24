import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../model/popular_article_model.dart';
import '../utils/constants.dart';
import '../utils/global.dart';

class GetArticleController {
  PopularArticleModel popularArticleModel = PopularArticleModel();

  getAllArticles() async {
    try {
      var url = Uri.parse(Urls.baseUrl);
      var response = await http.get(url);
      var map = jsonDecode(response.body);
      popularArticleModel = PopularArticleModel.fromJson(map);
    } on SocketException catch (socketException) {
      toastMessage('Please check your internet connection and try again!');
    } catch (exception) {
      toastMessage('Something went wrong, try again!');
    }
  }
}
