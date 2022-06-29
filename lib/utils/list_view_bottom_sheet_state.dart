/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class BottomSheetState extends InheritedWidget {
  final ScrollController scrollController;
  const BottomSheetState({
    Key? key,
    required this.scrollController,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant BottomSheetState oldWidget) {
    return scrollController != oldWidget.scrollController;
  }
}
