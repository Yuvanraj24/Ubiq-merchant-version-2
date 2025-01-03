import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    this.fieldValidation,
    required this.fieldLabelText,
    this.fieldInputFormatters,
    this.prefixIcon,
    this.suffixIcon,

    this.prefixOnTap,
    this.suffixOnTap,

    this.onChange,

    this.isFilled = false,
    this.fillColor,

    this.textMaxLines = 1,
    this.textMaxLength,
    this.textInputType,
    this.textHide = false,



  });

  final TextEditingController textEditingController;
  final String? Function(String?)? fieldValidation;
  final String fieldLabelText;
  final List<TextInputFormatter>? fieldInputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final Function()? prefixOnTap;
  final Function()? suffixOnTap;
  final Function(String)? onChange;


  final bool isFilled;
  final Color? fillColor;

  final int textMaxLines;
  final int? textMaxLength;
  final TextInputType? textInputType;
  final bool textHide;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: fieldValidation,
      maxLines: textMaxLines,
      maxLength: textMaxLength,
      keyboardType: textInputType,
      decoration:  InputDecoration(
          filled: isFilled,
          fillColor: fillColor,
          prefixIcon: prefixIcon != null ? InkWell(
              onTap: prefixOnTap,
              child: prefixIcon) : null,
          suffixIcon: suffixIcon != null ? InkWell(
              onTap: suffixOnTap,
              child: suffixIcon) : null,
          labelText: fieldLabelText,
          counterText: ''
      ),
      inputFormatters: fieldInputFormatters,
      obscureText: textHide,
      onChanged: onChange,
    );
  }
}