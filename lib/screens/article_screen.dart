import 'package:article_app/controllers/controllers_export.dart';
import 'package:article_app/utils/dateformatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleScreen extends GetView<ArticleScreenController> {
  const ArticleScreen({super.key});
  static const routeName = "/article";
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.article.value.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category: ${controller.article.value.category}",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                Text(
                  controller.article.value.description,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Author: ${controller.article.value.author}",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    Text(
                      "Read: ${controller.article.value.readTime}",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  ],
                ),
                Text(
                  "Created At: ${DateFormatter.formatDate(controller.article.value.createdAt)}",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
