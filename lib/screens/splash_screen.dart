import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:article_app/controllers/controllers_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            // Text("Articles App")
            AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('Articles',
                textStyle:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            TyperAnimatedText('App',
                textStyle:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            // TyperAnimatedText('articles'),
            TyperAnimatedText('...',
                textStyle:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}
