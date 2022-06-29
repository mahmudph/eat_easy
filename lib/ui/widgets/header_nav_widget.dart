/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';
import 'button_icon_widget.dart';
import 'menu_widget.dart';

class HeaderNavWidget extends StatelessWidget {
  final bool withLeftIcon;
  final bool withNavMenu;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onPressLeftIcon, onPressRightIcon;
  final String? title;
  final bool withBackButton;
  const HeaderNavWidget({
    Key? key,
    this.withLeftIcon = true,
    this.withNavMenu = false,
    this.leftIcon,
    this.rightIcon,
    this.title,
    this.withBackButton = true,
    this.onPressLeftIcon,
    this.onPressRightIcon,
  })  : assert(
          (withLeftIcon == true || withNavMenu == true),
          "withLeftIcon and withNavMenu must one of them be true",
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: (withLeftIcon && withNavMenu)
              ? MainAxisAlignment.spaceBetween
              : withLeftIcon && !withNavMenu
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
          children: [
            if (withLeftIcon && withBackButton)
              ButtonIconWidget(
                icon: leftIcon ?? Icons.arrow_back,
                onPress: onPressLeftIcon ?? () => Navigator.pop(context),
              ),
            if (withLeftIcon && !withBackButton)
              Icon(
                leftIcon,
              ),
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            if (withLeftIcon && title != null) const Spacer(),
            if (withNavMenu)
              MenuWidget(
                onPress: onPressRightIcon ?? () => {},
              ),
          ],
        ),
      ],
    );
  }
}
