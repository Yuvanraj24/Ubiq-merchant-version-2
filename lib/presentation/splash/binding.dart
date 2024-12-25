import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/splash/controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(),);
  }
}