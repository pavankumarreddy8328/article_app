import 'package:article_app/controllers/controller.dart';
import 'package:article_app/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateArticleController extends Controller {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController readTimeController = TextEditingController();
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>(); // Form key
  String? articleId = "";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    articleId = Get.parameters['id'];
    if (articleId != null) {
      getArticleById(articleId!);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    authorController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    readTimeController.dispose();
    super.dispose();
  }

  Future<Article> getArticleById(String id) async {
    try {
      final response = await api.getArticle(id);
      titleController.text = response.title;
      authorController.text = response.author;
      categoryController.text = response.category;
      descriptionController.text = response.description;
      readTimeController.text = response.readTime.toString();
      return response;
    } catch (e) {
      print(e.toString());
      return Article.error(e.toString());
    }
  }

  Future<Article> createArticle(String title, String description, String author,
      String category, int readTime) async {
    isLoading.value = true;
    try {
      final response = await api.createArticle(
          title, description, author, category, readTime);
      // Show success message
      cleanControllers();
      Get.back();
      Get.snackbar(
        "Form",
        "Submitted Successfully.",
        snackPosition: SnackPosition.BOTTOM,
      );

      return response;
    } catch (e) {
      Get.snackbar(
        "Error happened",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
      return Article.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<Article> updateArticle(
      String title, String description, String author, String category) async {
    isLoading.value = true;
    try {
      final response = await api.patchArticle(
          articleId!, title, description, author, category);
      // Show success message
      Get.back();
      Get.snackbar(
        "Form",
        "Submitted Successfully.",
        snackPosition: SnackPosition.BOTTOM,
      );
      cleanControllers();

      return response;
    } catch (e) {
      Get.snackbar(
        "Error happened",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
      return Article.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void cleanControllers() {
    titleController.clear();
    authorController.clear();
    categoryController.clear();
    descriptionController.clear();
    readTimeController.clear();
  }
}
