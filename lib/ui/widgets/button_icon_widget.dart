/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  final IconData icon;

  final Color color;
  final Color iconColor;
  final VoidCallback? onPress;

  const ButtonIconWidget({
    Key? key,
    this.icon = Icons.arrow_back,
    this.color = Colors.white,
    this.iconColor = Colors.black,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: IconButton(
              onPressed: onPress,
              padding: const EdgeInsets.all(6),
              constraints: const BoxConstraints(),
              icon: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
