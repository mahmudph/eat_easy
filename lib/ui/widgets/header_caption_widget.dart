/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class HeaderCaptionWidget extends StatelessWidget {
  final String title, subTitle;
  final double marginTop;
  const HeaderCaptionWidget({
    Key? key,
    this.marginTop = 40,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: marginTop,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "DM Sans",
              color: Color(0xff32324D),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "Muhim",
              color: Color(0xff8E8EA9),
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
