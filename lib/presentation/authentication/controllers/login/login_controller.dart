import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ubiqmerchant_version_2/core/assets/images.dart';
import 'package:ubiqmerchant_version_2/core/assets/texts.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';
import 'package:ubiqmerchant_version_2/data/api/services/auth_service.dart';
import 'package:ubiqmerchant_version_2/data/api/services/network_manager/network_manager.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/model/login/login_model.dart';
import 'package:ubiqmerchant_version_2/utils/local_storage/functions/app_storage_functions.dart';
import 'package:ubiqmerchant_version_2/widgets_common/custom_toasts/toasts.dart';

import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {

  static LoginController get instance => Get.find();

  final mobileNoController = TextEditingController();
  RxList<TextEditingController?> otpControllers = RxList(<TextEditingController?>[]);

  RxString countryCode = "91".obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  RxBool isValidLogin = false.obs;

  @override
  void onInit() {
    otpControllers.value = List.generate(4, (index) => TextEditingController());
    super.onInit();

  }

  Rx<LoginModel> loginResponse = Rx(LoginModel());

   LoginModel get userLoginData => loginResponse.value;

  isUserFoundTrigger() async {
    try {

      FocusManager.instance.primaryFocus?.unfocus();
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

        loginResponse.value =  LoginModel.fromJson(response.data);

        if(userLoginData.success!){
          print("true Login response.statusCode ===> ${response.statusCode}");
          print("true Login response.body ===> ${response.data}");

          // Set OTP controllers
          for (int i = 0; i < userLoginData.user!.userOtp.toString().length; i++) {
            otpControllers[i]?.text = userLoginData.user!.userOtp.toString()[i];
          }

          // Store User Auth Token in Local Storage
          AppLocalStorageFunctions.saveUserToken(userLoginData.user!.token!);
        }
        else {
          clearOtpFields();
          SiajToasts.errorSnackBar(title: AppTextStrings.loginFailed, message: userLoginData.message);
        }
      }

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

    } catch(e) {

      // show some Generic Error to the user
      SiajFullScreenLoader.stopLoading();
      clearOtpFields();
      SiajToasts.errorSnackBar(title: AppTextStrings.loginFailed, message: AppTextStrings.somethingWentWrong);
    }}

  userLoginTrigger() async {
    try {

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      if(AppLocalStorageFunctions.getUserToken() != null){
        AppLocalStorageFunctions.setUserLoggedIn(true);

        SiajToasts.successSnackBar(title: "Login", message: "Successfully logged in");
        //Redirect to next Screen
        AuthService.screenRedirect();

      }

    } catch(e) {
      // show some Generic Error to the user
      SiajFullScreenLoader.stopLoading();
      SiajToasts.errorSnackBar(title: "On Snap!", message: e.toString());
    }

  }

  clearOtpFields(){
    for (int i = 0; i < 4; i++) {
      otpControllers[i]?.clear();
    }
  }

  checkIsLoginValid(){
    print("valid is ---> ${isValidLogin.value}");


    if(mobileNoController.text.isNotEmpty && mobileNoController.text.length == 10 && otpControllers[0]!.text.isNotEmpty && otpControllers[1]!.text.isNotEmpty && otpControllers[2]!.text.isNotEmpty && otpControllers[3]!.text.isNotEmpty){
      isValidLogin = true.obs;
    } else {
      isValidLogin = false.obs;
    }

    print("valid is end ---> ${isValidLogin.value}");

  }

  userLogout(){
    AppLocalStorageFunctions.clearAllData();
    Get.offAllNamed(Routes.login);
  }

}
