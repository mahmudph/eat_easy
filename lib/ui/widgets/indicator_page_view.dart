/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class IndicatorPageViewWidget extends StatelessWidget {
  final int pageLength;
  final int currentPage;
  final double width, height;

  const IndicatorPageViewWidget({
    Key? key,
    required this.pageLength,
    required this.currentPage,
    this.width = 90,
    this.height = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xffEAEAEF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 500),
            width: width / pageLength,
            height: height,
            left: currentPage * width / pageLength,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffFFB01D),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
