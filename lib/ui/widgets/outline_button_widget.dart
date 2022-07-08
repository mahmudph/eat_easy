/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String? title;
  final Color buttonColor;
  final Color textColor;

  final Widget? child;
  const OutlineButtonWidget({
    Key? key,
    required this.onPress,
    required this.buttonColor,
    this.textColor = const Color(0xff8E8EA9),
    this.title,
    this.child,
  })  : assert(
          title == null && child != null || title != null && child == null,
          "when title is null, child must be null",
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.15,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: buttonColor,
          alignment: Alignment.center,
          minimumSize: const Size(60, 0),
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPress,
        child: SizedBox(
          width: double.infinity,
          child: child ?? _defaultChildWidget(context),
        ),
      ),
    );
  }

  Widget _defaultChildWidget(BuildContext context) {
    return Text(
      title!,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Mucrim",
        fontSize: 16,
        color: textColor,
      ),
    );
  }
}
