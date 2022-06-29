/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class OtpFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusScope;
  final bool isLastField;

  const OtpFormFieldWidget({
    Key? key,
    this.isLastField = false,
    required this.controller,
    required this.focusScope,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            focusNode: focusScope,
            textAlign: TextAlign.center,
            controller: controller,
            keyboardType: TextInputType.number,
            textInputAction:
                isLastField ? TextInputAction.done : TextInputAction.next,
            maxLength: 1,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Mulish",
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              counter: null,
              counterText: "",
              contentPadding: EdgeInsets.all(0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: SizedBox(
              width: 15,
              child: Divider(
                color: Colors.black,
                height: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
