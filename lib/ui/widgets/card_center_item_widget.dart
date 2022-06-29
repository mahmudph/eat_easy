/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class CardCenterItemWidget extends StatelessWidget {
  final String pathImage, title, description;
  final VoidCallback? onTap;
  const CardCenterItemWidget({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CardWidget(
      onPress: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.25,
            child: Image.asset(
              pathImage,
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
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Mulish",
              color: Color(0xff8E8EA9),
            ),
          ),
        ],
      ),
    );
  }
}
