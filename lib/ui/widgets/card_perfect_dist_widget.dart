/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';
import 'button_icon_widget.dart';
import 'card_widget.dart';

class CardPrefectDistWidget extends StatelessWidget {
  final String pathImageIcon;
  final String title, description;
  final VoidCallback? onPress;
  const CardPrefectDistWidget({
    Key? key,
    required this.pathImageIcon,
    required this.title,
    required this.description,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._headerContentWidget(context),
          _bottomContentWidget(context),
        ],
      ),
    );
  }

  List<Widget> _headerContentWidget(BuildContext context) {
    return [
      SizedBox(
        width: 70,
        height: 70,
        child: Image.asset(
          pathImageIcon,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "Mulish",
          color: Color(0xff212134),
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }

  Widget _bottomContentWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            description,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Mulish",
              color: Color(0xff8E8EA9),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        ButtonIconWidget(
          onPress: onPress,
          icon: Icons.arrow_forward,
          color: const Color(0xffFFF2EA),
          iconColor: const Color(0xffFF7B2C),
        )
      ],
    );
  }
}
