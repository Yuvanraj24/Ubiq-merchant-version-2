import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/assets/texts.dart';
import 'package:ubiqmerchant_version_2/data/api/services/auth_service.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  RxList<ProfileMenuModel> profileMenu = RxList([
    ProfileMenuModel(
        title: AppTextStrings.orderHistory,
        iconData: Icons.shopping_cart_rounded,
        isComingSoon: false),
    ProfileMenuModel(
        title: AppTextStrings.privacyPolicy,
        iconData: Icons.help,
        isComingSoon: false),
    ProfileMenuModel(
        title: AppTextStrings.faq, iconData: Icons.chat, isComingSoon: false),
    ProfileMenuModel(
        title: AppTextStrings.termsAndConditions,
        iconData: Icons.policy,
        isComingSoon: false),
    ProfileMenuModel(
        title: AppTextStrings.share,
        iconData: Icons.share,
        isComingSoon: false),
    ProfileMenuModel(
        title: AppTextStrings.logout,
        iconData: Icons.logout,
        isComingSoon: false),
  ]);

  menuOnTap(int onTapIndex) {
    switch (onTapIndex) {
      case 0:
        orderHistory();
        break;
      case 1:
        privacyPolicy();
        break;
      case 2:
        getFaq();
        break;
      case 3:
        termsAndConditions();
        break;

      case 4:
        shareAppLink();
        break;

      case 5:
        AuthService.logout();
        break;
    }
  }

  orderHistory() {}

  privacyPolicy() {}

  getFaq() {}

  termsAndConditions() {}

  shareAppLink() {}
}

class ProfileMenuModel {
  String title;
  IconData iconData;
  bool isComingSoon;

  ProfileMenuModel(
      {required this.title,
      required this.iconData,
      required this.isComingSoon});
}
