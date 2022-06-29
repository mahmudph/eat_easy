/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/models.dart';
import 'package:flutter/material.dart';

import 'product_detail_conten_widget.dart';
import 'product_topping_item_widget.dart';

class ListProductToppingsWidget extends StatelessWidget {
  final List<ProductToppings> listToppings;
  final String productId;
  const ListProductToppingsWidget({
    Key? key,
    required this.listToppings,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductDetailContenWidget(
      title: "Add toppings",
      childPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        child: ListView.separated(
          itemCount: listToppings.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          shrinkWrap: true,
          separatorBuilder: (_, i) => const SizedBox(
            height: 15,
          ),
          itemBuilder: (_, i) {
            return ProductToppingItemWidget(
              toppings: listToppings[i],
              productId: productId,
            );
          },
        ),
      ),
    );
  }
}
