import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ubiqmerchant_version_2/utils/validators/validation.dart';

class OtpFieldsWidget extends StatelessWidget {
  const OtpFieldsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      handleControllers: (controllers) {
        controllers[0]!.text = "1";
        controllers[1]!.text = "0";
        controllers[2]!.text = "3";
        controllers[3]!.text = "2";
      },
      borderColor: const Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      inputFormatters: SiajValidator.mobileNumberInputFormatters,
      fieldWidth: 50,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here

      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode){
        /// After OTP submission
        showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: const Text("Verification Code"),
                content: Text('Code entered is $verificationCode'),
              );
            }
        );
      }, // end onSubmit
    );
  }
}