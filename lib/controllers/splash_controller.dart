import 'package:article_app/screens/screens_export.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(HomeScreen.routeName); // Navigate using named route
    });
  }
}
