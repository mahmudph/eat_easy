/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class ProductDetailContenWidget extends StatelessWidget {
  final EdgeInsets? titlePadding;
  final EdgeInsets? childPadding;
  final String title;
  final Widget child;
  const ProductDetailContenWidget({
    Key? key,
    required this.title,
    required this.child,
    this.titlePadding,
    this.childPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: titlePadding ?? const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Mulish",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff666687),
              ),
            ),
          ),
          Padding(
            padding: childPadding ??
                const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24,
                ),
            child: child,
          )
        ],
      ),
    );
  }
}
