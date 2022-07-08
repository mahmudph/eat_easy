/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final double productPrice;
  final double fontSize;
  const ProductPrice({
    Key? key,
    required this.productPrice,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "\$ ",
        style: TextStyle(
          fontSize: (fontSize - 5),
          fontFamily: "Mulish",
          color: const Color(0xffFF7B2C),
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: productPrice.toStringAsFixed(2),
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: "Mulish",
              color: const Color(0xffFF7B2C),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
