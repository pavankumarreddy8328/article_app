import 'package:article_app/controllers/controllers_export.dart';
import 'package:article_app/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends Controller with WidgetsBindingObserver {
  RxInt pageSize = 17.obs;
  RxList<Article> articles = <Article>[].obs;
  //"total_records":48,"current_page":1,"last_page":3,"
  RxInt totalRecords = 0.obs;
  RxInt currentPage = 1.obs;
  RxInt lastPage = 0.obs;
  RxBool isArticlesLoading = false.obs;
  late final pagingController = PagingController<int, Article>(
    getNextPageKey: _getNextPageKey,
    fetchPage: (pageKey) => getAllArticlesByParams(page: pageKey),
  );
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    pagingController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    pagingController.refresh(); //
    super.onReady();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    if (state == AppLifecycleState.resumed) {
      pagingController.refresh(); // Refresh when returning to the app
    }
    super.didChangeAppLifecycleState(state);
  }

  void refreshPage() {
    pagingController.refresh();
  }

  int? _getNextPageKey(PagingState<int, Article> state) {
    final keys = state.keys;
    final pages = state.pages;
    // Initial page key.
    if (keys == null) return 1;

    // Check for last page.
    if (pages != null && pages.last.length < pageSize.value)
      return null; // <-- this is it

    // Next page key.
    return keys.last + 1;
  }

  Future<List<Article>> getAllArticlesByParams(
      {required int page, int? size}) async {
    isArticlesLoading.value = true;
    try {
      final response = await api.getAllArticlesByParams(page: page);
      totalRecords.value = response.data.totalRecords;
      currentPage.value = response.data.currentPage + 1;
      lastPage.value = response.data.lastPage;
      isArticlesLoading.value = false;
      return response.data.records;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
