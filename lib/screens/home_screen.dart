import 'package:article_app/controllers/controllers_export.dart';
import 'package:article_app/models/article_model.dart';
import 'package:article_app/screens/article_screen.dart';
import 'package:article_app/screens/screens_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  static const routeName = "/home";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Articles"),
        actions: [
          ElevatedButton(
              onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: Text("Filters"))
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          children: [],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => controller.pagingController.refresh(),
        child: PagingListener(
          controller: controller.pagingController,
          builder:
              (BuildContext context, state, void Function() fetchNextPage) {
            return PagedListView<int, Article>(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, item, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Get.toNamed("${ArticleScreen.routeName}/${item.id}");
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.black)),
                    title: Row(
                      children: [
                        Expanded(
                            child: Text(
                          item.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        IconButton(
                            onPressed: () {
                              Get.toNamed(
                                  "${UpdateArticle.routeName}/${item.id}");
                            },
                            icon: Icon(Icons.edit_outlined))
                      ],
                    ),
                    subtitle: Text(item.description),
                  ),
                );
              }, noItemsFoundIndicatorBuilder: (_) {
                return Center(child: Text("No Items Found"));
              }, noMoreItemsIndicatorBuilder: (_) {
                return Center(child: Text("No More Items"));
              }),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(CreateArticle.routeName);
          },
          child: Icon(Icons.add)),
    );
  }
}
