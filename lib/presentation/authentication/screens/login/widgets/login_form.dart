import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/assets/texts.dart';
import 'package:ubiqmerchant_version_2/core/constants/app_sizes.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/auth_common_widgets/auth_textformfield.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/controllers/login/login_controller.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/screens/login/widgets/otp_fields.dart';
import 'package:ubiqmerchant_version_2/utils/validators/validation.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.loginFormKey,
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
      child: Column(
        children: [
          /// Mobile Number
          AuthTextFormField(
            textEditingController: controller.mobileNoController,
            textInputType: TextInputType.phone,
            fieldValidation: SiajValidator.validatePhoneNumber,
            fieldLabelText: AppTextStrings.phoneNo,
            fieldInputFormatters: SiajValidator.mobileNumberInputFormatters,
            textMaxLength: 10,
            onChange: (v) => v.length == 10 ? controller.isUserFoundTrigger() : null,
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          ///OTP fields
          OtpFieldsWidget(),

          const SizedBox(height: AppSizes.spaceBtwSections),

          /// Sign In Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.userLoginTrigger() ,
                  child: const Text(AppTextStrings.signIn))),
          const SizedBox(height: AppSizes.spaceBtwSections),
        ],
      ),
    ));
  }
}
