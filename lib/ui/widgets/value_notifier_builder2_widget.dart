/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueNotifierBuilder2<A, B> extends StatelessWidget {
  final ValueListenable<A> listenable1;
  final ValueListenable<B> listenable2;

  final Widget Function(BuildContext, A, B, Widget?) builder;

  final Widget? child;

  const ValueNotifierBuilder2({
    Key? key,
    required this.listenable1,
    required this.listenable2,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: listenable1,
      builder: (_, value1, __) {
        return ValueListenableBuilder<B>(
          valueListenable: listenable2,
          builder: (_, value2, __) {
            return builder(context, value1, value2, child);
          },
        );
      },
    );
  }
}
