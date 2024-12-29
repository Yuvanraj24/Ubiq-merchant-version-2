import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/controllers/login/login_controller.dart';
import 'package:ubiqmerchant_version_2/utils/validators/validation.dart';

class OtpFieldsWidget extends GetView<LoginController> {
  const OtpFieldsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      handleControllers: (controllers) {
        controller.otpControllers.value = controllers;
      },
      borderColor: const Color(0xFF512DA8),
      showFieldAsBox: true,
      inputFormatters: SiajValidator.mobileNumberInputFormatters,
      fieldWidth: 50,
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode){
        /// After OTP submission
      }
    );
  }
}