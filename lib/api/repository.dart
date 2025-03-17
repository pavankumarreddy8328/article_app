import 'dart:developer';

import 'package:article_app/models/article_model.dart';
import 'package:article_app/models/articles_response.dart';
import 'package:get/get.dart';

class APIRepository extends GetConnect {
  final url = "https://flutter.starbuzz.tech";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    httpClient.baseUrl = "https://flutter.starbuzz.tech";
    httpClient.defaultContentType = "application/json";
  }

  Map<String, String> headers() {
    return {};
  }

  Future<ArticlesResponse> getAllArticles() async {
    final response = await get("$url/articles", headers: headers());

    if (response.status.hasError) {
      return Future.error(response.body);
    } else {
      log("Successfull Request::");
      return allArticlesResponseFromJson(response.bodyString!);
    }
  }

  Future<ArticlesResponse> getAllArticlesByParams(
      {required int page, int? size}) async {
    final response = await get(
      "$url/articles?page=$page",
      headers: headers(),
    );

    if (response.status.hasError) {
      return Future.error(response.body);
    } else {
      log("Successfull Request::");
      return allArticlesResponseFromJson(response.bodyString!);
    }
  }

  Future<Article> getArticle(String articleId) async {
    final response = await get("$url/articles/$articleId", headers: headers());

    if (response.status.hasError) {
      return Future.error(response.body);
    } else {
      log("Successfull Request::");
      return articleResponseFromJson(response.bodyString!);
    }
  }

  //Create Article

  Future<Article> createArticle(String title, String description, String author,
      String category, int readTime) async {
    final response = await post(
      "$url/articles",
      {
        "title": title,
        "description": description,
        "author": author,
        "category": category,
        "read_time": readTime
      },
      headers: headers(),
    );

    if (response.status.hasError) {
      return Future.error(response.body);
    } else {
      log("Successfull Request::");
      return articleResponseFromJson(response.bodyString!);
    }
  }

  Future<Article> patchArticle(String articleId, String title,
      String description, String author, String category) async {
    final response = await patch(
      "$url/articles/$articleId",
      {
        "title": title,
        "description": description,
        "author": author,
        "category": category,
      },
      headers: headers(),
    );

    if (response.status.hasError) {
      return Future.error(response.body);
    } else {
      log("Successfull Request::");
      return articleResponseFromJson(response.bodyString!);
    }
  }
}
