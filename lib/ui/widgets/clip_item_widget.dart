/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class ClipItemWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor, textColor;
  final Color isActiveBackgroundColor;
  final Color isActiveTextColor;
  final bool isActive;
  final bool enableBorder;
  final VoidCallback? onTap;
  const ClipItemWidget({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.isActiveBackgroundColor,
    required this.isActiveTextColor,
    this.textColor = Colors.white,
    this.enableBorder = true,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          color: isActive ? isActiveBackgroundColor : backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: enableBorder
              ? Border.all(
                  color: const Color(0xffDCDCE4),
                  width: 1,
                )
              : null,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Mulish",
            fontWeight: FontWeight.w500,
            color: isActive ? isActiveTextColor : textColor,
          ),
        ),
      ),
    );
  }
}
