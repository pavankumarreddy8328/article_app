import 'package:article_app/controllers/controllers_export.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
 @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
  }
}