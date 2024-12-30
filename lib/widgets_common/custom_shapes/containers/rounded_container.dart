import 'package:flutter/material.dart';
import 'package:ubiqmerchant_version_2/core/constants/app_sizes.dart';
import 'package:ubiqmerchant_version_2/core/theme/color.dart';

class SiajRoundedContainer extends StatelessWidget {
  const SiajRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = AppSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = AppColors.borderPrimary,
      this.backgroundColor,
      this.padding,
      this.margin});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,
    );
  }
}
