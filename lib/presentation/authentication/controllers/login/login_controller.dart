import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ubiqmerchant_version_2/core/assets/images.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';
import 'package:ubiqmerchant_version_2/data/api/services/auth_service.dart';
import 'package:ubiqmerchant_version_2/data/api/services/network_manager/network_manager.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/model/login/login_model.dart';
import 'package:ubiqmerchant_version_2/widgets_common/custom_toasts/toasts.dart';

import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  final localStorage = GetStorage();
  final mobileNoController = TextEditingController();
  RxString countryCode = "91".obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Rx loginResponse = Rx();

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

        LoginModel.fromJson(response.data);

        if(response.data['success']){
          print("true Login response.statusCode ===> ${response.statusCode}");
          print("true Login response.body ===> ${response.data}");
        }
      }

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

      //Redirect

    } catch(e) {
      // show some Generic Error to the user
      SiajFullScreenLoader.stopLoading();
      SiajToasts.errorSnackBar(title: "On Snap!", message: e.toString());
    }

  }

}
