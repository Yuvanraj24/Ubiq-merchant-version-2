import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/assets/images.dart';
import 'package:ubiqmerchant_version_2/data/api/services/auth_service.dart';
import 'package:ubiqmerchant_version_2/data/api/services/network_manager/network_manager.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/model/login/login_model.dart';
import 'package:ubiqmerchant_version_2/presentation/splash/controller.dart';
import 'package:ubiqmerchant_version_2/utils/local_storage/functions/app_storage_functions.dart';
import 'package:ubiqmerchant_version_2/widgets_common/custom_toasts/toasts.dart';

import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {

  final mobileNoController = TextEditingController();
  RxList<TextEditingController?> otpControllers = RxList(<TextEditingController?>[]);

  RxString countryCode = "91".obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Rx loginResponse = Rx();
  @override
  void onInit() {
    otpControllers.value = List.generate(4, (index) => TextEditingController());
    super.onInit();

  }

  isUserFound() async {
    try {

      // Start Loading
      SiajFullScreenLoader.openLoadingDialog(
          "Logging you in...", AppImages.loginLoaderLottie);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      print("Form state ---> ${loginFormKey.currentState!.validate()}");

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      final response = await AuthService.login(mobileNoController.text, countryCode.value);
      print("Login response.success ===> ${response.success}");

      if(response.success){
        print("Login response.statusCode ===> ${response.statusCode}");
        print("Login response.body ===> ${response.data}");
        print("Login response.body json success ===> ${response.data['success']}");

        LoginModel userLoginData =  LoginModel.fromJson(response.data);

        if(userLoginData.success!){
          print("true Login response.statusCode ===> ${response.statusCode}");
          print("true Login response.body ===> ${response.data}");

          // Store User Data in Local Storage
          AppLocalStorageFunctions.saveUserToken(userLoginData.user!.token!);
          AppLocalStorageFunctions.setUserLoggedIn(userLoginData.success!);

          //Redirect to next Screen
          SplashController.instance.screenRedirect();

        }
      }

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

    } catch(e) {
      // show some Generic Error to the user
      SiajFullScreenLoader.stopLoading();
      SiajToasts.errorSnackBar(title: "On Snap!", message: e.toString());
    }

  }


  userLogin() async {
    try {

      // Start Loading
      SiajFullScreenLoader.openLoadingDialog(
          "Logging you in...", AppImages.loginLoaderLottie);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      if(AppLocalStorageFunctions.getUserToken() != null){
        AppLocalStorageFunctions.setUserLoggedIn(true);

        //Redirect to next Screen
        SplashController.instance.screenRedirect();
      }

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

    } catch(e) {
      // show some Generic Error to the user
      SiajFullScreenLoader.stopLoading();
      SiajToasts.errorSnackBar(title: "On Snap!", message: e.toString());
    }

  }

}
