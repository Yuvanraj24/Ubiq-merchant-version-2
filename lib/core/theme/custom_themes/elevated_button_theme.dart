import 'package:flutter/material.dart';
import 'package:ubiqmerchant_version_2/core/theme/color.dart';

class SiajElevatedButtonTheme {
  SiajElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.darkPurple,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side:  const BorderSide(color: AppColors.darkPurple),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w600),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: Colors.blue),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w600),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      )
  );

}