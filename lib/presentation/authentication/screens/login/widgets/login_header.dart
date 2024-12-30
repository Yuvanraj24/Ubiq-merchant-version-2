import 'package:flutter/material.dart';
import 'package:ubiqmerchant_version_2/core/assets/images.dart';
import 'package:ubiqmerchant_version_2/core/assets/texts.dart';
import 'package:ubiqmerchant_version_2/core/constants/app_sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

      /// App Image Login logo Image
      Center(
        child: Container(
        height: 150,
        width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(AppImages.appLogo))
          ),
        ),
      ),

      const SizedBox(height: AppSizes.defaultSpace / 2),

      Text(AppTextStrings.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: AppSizes.sm),
      Text(AppTextStrings.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium),
    ]);
  }
}

