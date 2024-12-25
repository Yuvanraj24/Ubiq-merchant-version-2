import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';

class LoginController extends GetxController {
  final localStorage = GetStorage();
  final mobileNoController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  login() {
    Get.offAllNamed(Routes.mainView);
  }
}
