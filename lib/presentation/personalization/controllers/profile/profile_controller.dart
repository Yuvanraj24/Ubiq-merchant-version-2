import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/assets/texts.dart';

class ProfileController extends GetxController {


  static ProfileController get instance => Get.find();

  RxList<ProfileMenuModel> profileMenu = RxList([
    ProfileMenuModel(title: AppTextStrings.orderHistory, iconData: Icons.shopping_cart_rounded, isComingSoon: false),
    ProfileMenuModel(title: AppTextStrings.privacyPolicy, iconData: Icons.help, isComingSoon: false),
    ProfileMenuModel(title: AppTextStrings.faq, iconData: Icons.chat, isComingSoon: false),
    ProfileMenuModel(title: AppTextStrings.termsAndConditions, iconData: Icons.policy, isComingSoon: false),
    ProfileMenuModel(title: AppTextStrings.share, iconData: Icons.share, isComingSoon: false),
    ProfileMenuModel(title: AppTextStrings.logout, iconData: Icons.logout, isComingSoon: false),
  ]);

  menuOnTap(int onTapIndex){
    switch (onTapIndex){
      case 0 :
      break;
      case 1 :
        break;

    }
  }


}

class ProfileMenuModel{
  String title;
  IconData iconData;
  bool isComingSoon;
  ProfileMenuModel({
    required this.title,
    required this.iconData,
    required this.isComingSoon

  });
}