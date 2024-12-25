import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';

class SplashController extends GetxController {
  final deviceStorage = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 2),() {
      screenNavigation();
    },
    );
  }

  screenNavigation(){
    // Local Storage
    deviceStorage.writeIfNull("isFirstTime", true);
    Get.offAllNamed(Routes.login);

    // // Check if it's the first time launching the app
    // deviceStorage.read("isFirstTime") != true
    //     ? Get.offAllNamed(Routes.login):
    //     Get.offAllNamed(Routes.onboarding);
  }


}