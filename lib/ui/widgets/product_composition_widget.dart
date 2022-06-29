/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/models.dart';
import 'product_composition_item_widget.dart';
import 'package:flutter/material.dart';

class ProductCompositionWidget extends StatelessWidget {
  final List<CompositionSize> compositionSize;

  const ProductCompositionWidget({
    Key? key,
    required this.compositionSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 3),
            spreadRadius: 2,
          )
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: compositionSize
            .map(
              (e) => ProductCompositionitem(
                name: e.name,
                value: e.value,
              ),
            )
            .toList(),
      ),
    );
  }
}
