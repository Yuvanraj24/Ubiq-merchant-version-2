import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/theme/color.dart';
import 'package:ubiqmerchant_version_2/presentation/main/controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
        bottomNavigationBar: Obx(
                () => NavigationBar(
                height: 80,
                elevation: 0,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) => controller.selectedIndex.value = index,
                backgroundColor: AppColors.light,
                indicatorColor:  AppColors.primaryColor.withValues(alpha:.1),
                destinations:  controller.iconTabs
                )
        )
      ),
    );
  }
}
