/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class SparateIndicatorWidget extends StatelessWidget {
  final double widthSparator;

  const SparateIndicatorWidget({
    Key? key,
    required this.widthSparator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _indicatorWidget(
          context,
        ),
        _indicatorWidget(context, true),
        _indicatorWidget(
          context,
        ),
      ],
    );
  }

  Widget _indicatorWidget(
    BuildContext context, [
    bool isText = false,
  ]) {
    if (isText) {
      return const Text(
        "OR",
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xffA5A5BA)),
      );
    }

    return LayoutBuilder(
      builder: (_, size) {
        return Container(
          width: widthSparator,
          height: 1,
          color: const Color(0xffDCDCE4),
        );
      },
    );
  }
}
