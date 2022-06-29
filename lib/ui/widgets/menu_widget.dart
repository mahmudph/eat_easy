/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final VoidCallback? onPress;

  const MenuWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onPress,
          child: SizedBox(
            height: 30,
            width: 30,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "lib/assets/icons/menu.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
