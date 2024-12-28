import 'package:flutter/material.dart';
import 'package:ubiqmerchant_version_2/core/constants/app_sizes.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/screens/login/widgets/login_form.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/screens/login/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: AppSizes.appBarHeight * 4,
                  left: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace,
                  right: AppSizes.defaultSpace
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginHeader(),
                    const LoginForm(),
                  ]),
            )
        ),
      ),
    );
  }
}