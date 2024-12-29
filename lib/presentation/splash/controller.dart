import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/constants/storage_keys.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';
import 'package:ubiqmerchant_version_2/utils/local_storage/functions/app_storage_functions.dart';
import 'package:ubiqmerchant_version_2/utils/local_storage/functions/storage_functions.dart';

class SplashController extends GetxController {

  static SplashController get instance => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 2),() {
      screenRedirect();
    });
  }


  /// Functions to determine the relevant screen and redirect accordingly
  screenRedirect() async {

    if (AppLocalStorageFunctions.isUserLoggedIn() && AppLocalStorageFunctions.getUserToken() != null) {
      Get.offAllNamed(Routes.mainView);
    } else {

      // Local Storage
      LocalStorageFunctions.deviceStorage.writeIfNull(StorageKeys.isFirstTime, true);

      Get.offAllNamed(Routes.login);

      /// Future use  :
      /*
      // Check if it's the first time launching the app
      LocalStorageFunctions.deviceStorage.read(StorageKeys.isFirstTime) != true
          ? Get.offAllNamed(Routes.login)
          : Get.offAllNamed(Routes.onboarding);
       */
    }
  }


}