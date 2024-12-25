import 'package:flutter/material.dart';
import 'package:ubiqmerchant_version_2/core/theme/color.dart';


class SiajFloatingActionButtonTheme {
  SiajFloatingActionButtonTheme._();

  static final lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    shape:  CircleBorder(
      side: BorderSide(
        color: AppColors.appWhite.withOpacity(.5)
      )
    ),
    backgroundColor: AppColors.darkPurple,
    elevation: 1,
    foregroundColor: AppColors.appWhite,
    // splashColor: AppColors.darkPurple.withOpacity(10),
  );
}