
import 'package:article_app/bindings/bindings_export.dart';
import 'package:article_app/screens/screens_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(
        name: SplashScreen.routeName,
        page: () => SplashScreen(),
        binding: SplashBinding(),
        transition: Transition.circularReveal,
        curve: Curves.easeInCubic,
        transitionDuration: Duration(seconds: 1)),
   
    GetPage(
        name: HomeScreen.routeName,
        page: () => HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.circularReveal,
        curve: Curves.easeInCubic,
        transitionDuration: Duration(seconds: 1)),
    GetPage(
        name: '${ArticleScreen.routeName}/:id',
        page: () => ArticleScreen(),
        binding: ArticleScreenBinding(),
        transition: Transition.circularReveal,
        curve: Curves.easeInCubic,
        transitionDuration: Duration(seconds: 1)),
     GetPage(
        name: CreateArticle.routeName,
        page: () => CreateArticle(),
        binding: CreateArticleBinding(),
        transition: Transition.circularReveal,
        curve: Curves.easeInCubic,
        transitionDuration: Duration(seconds: 1)),
     GetPage(
        name: '${UpdateArticle.routeName}/:id',
        page: () => UpdateArticle(),
        binding: CreateArticleBinding(),
        transition: Transition.circularReveal,
        curve: Curves.easeInCubic,
        transitionDuration: Duration(seconds: 1)),
  ];
}