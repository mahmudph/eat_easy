/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool showObscureToggle;
  final int maxLength;
  final int? maxLines;

  final VoidCallback? onPressSufixobscureTextIcon;

  const FormFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.showObscureToggle = false,
    this.maxLength = 30,
    this.maxLines,
    this.onPressSufixobscureTextIcon,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
  })
  //  : assert(
  //         obscureText == false ||
  //             obscureText == true && onPressSufixobscureTextIcon != null,
  //         "when obscureText is true then onPressSufixobscureTextIcon must not be null",
  //       ),
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: TextFormField(
        controller: controller,
        maxLines: obscureText ? 1 : maxLines,
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: showObscureToggle
              ? InkWell(
                  onTap: onPressSufixobscureTextIcon,
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff8E8EA9),
                  ),
                )
              : null,
          hintStyle: const TextStyle(
            color: Color(0xff8E8EA9),
            fontFamily: "Mulish",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          counter: null,
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xffEAEAEF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xffEAEAEF),
            ),
          ),
        ),
      ),
    );
  }
}
