import 'package:flutter/material.dart';
import 'package:ubiqmerchant_version_2/core/theme/color.dart';

class SiajTextButtonTheme {
  SiajTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(fontSize: 10,color: AppColors.darkPurple, fontWeight: FontWeight.w600),
    )
  );
}