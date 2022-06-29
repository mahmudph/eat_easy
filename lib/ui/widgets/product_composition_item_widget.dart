/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class ProductCompositionitem extends StatelessWidget {
  final String name, value;
  const ProductCompositionitem({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontFamily: "mulish",
            fontSize: 14,
            color: Color(0xff3A2D78),
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontFamily: "mulish",
            fontSize: 12,
            color: Color(0xff8E8EA9),
          ),
        ),
      ],
    );
  }
}
