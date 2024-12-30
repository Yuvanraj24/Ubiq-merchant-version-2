import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/personalization/controllers/profile/profile_controller.dart';
import 'package:ubiqmerchant_version_2/presentation/personalization/screens/widgets/profile_menu.dart';

class ProfileMenuBuilder extends StatelessWidget {
  const ProfileMenuBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: profileController.profileMenu.length,
          itemBuilder: (context, index) => ProfileMenu(
            text: profileController.profileMenu[index].title,
            icon: profileController.profileMenu[index].iconData,
            press: () => profileController.menuOnTap(index),
            isComingSoon: profileController.profileMenu[index].isComingSoon,
          )),
    );
  }
}
