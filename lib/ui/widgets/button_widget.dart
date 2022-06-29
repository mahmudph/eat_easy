/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color buttonColor, titleColor;
  const ButtonWidget({
    Key? key,
    required this.onPress,
    required this.buttonColor,
    required this.titleColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: titleColor,
        alignment: Alignment.center,
        shadowColor: Colors.white,
        side: BorderSide.none,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Mucrim",
              fontSize: 16,
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
