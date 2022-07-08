/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class ToggleOrderButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor, iconColor;
  final VoidCallback? onTap;

  const ToggleOrderButtonWidget({
    Key? key,
    this.icon = Icons.add,
    this.backgroundColor = const Color(0xffFFF2EA),
    this.iconColor = const Color(0xffFF7B2C),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: iconColor,
          size: 17,
        ),
      ),
    );
  }
}
