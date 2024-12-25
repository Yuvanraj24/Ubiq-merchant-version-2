import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/assets/images.dart';
import 'package:ubiqmerchant_version_2/core/theme/color.dart';
import 'package:ubiqmerchant_version_2/presentation/splash/controller.dart';


class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            AppImages.appLogo,
            height: Get.height / 5,
          )
              .animate().scaleXY(
              begin: .5,
              end: 1,
              duration: const Duration(milliseconds: 800),
              delay: const Duration(milliseconds: 500),
              curve: Curves.decelerate),
          Text('Ubiqmerchant')
        ]),
      ),
    );
  }
}
