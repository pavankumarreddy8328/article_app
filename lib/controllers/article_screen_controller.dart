import 'package:article_app/controllers/controllers_export.dart';
import 'package:article_app/models/article_model.dart';
import 'package:get/get.dart';

class ArticleScreenController extends Controller {
  Rx<Article> article = Article(
    id: '',
    title: '',
    author: '',
    category: '',
    description: '',
    readTime: 0,
    createdAt: '',
    updatedAt: '',
  ).obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String? articleId = Get.parameters['id'];
    getArticleById(articleId ?? "");
  }

  Future<Article> getArticleById(String id) async {
    isLoading.value = true;
    try {
      final response = await api.getArticle(id);
      article.value = response;
      return response;
    } catch (e) {
      print(e.toString());
      return Article.error(e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }
}
