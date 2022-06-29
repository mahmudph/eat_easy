/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/models.dart';
import 'package:flutter/material.dart';

import 'ingredients_item_widget.dart';
import 'product_detail_conten_widget.dart';

class IngredientsListWidget extends StatelessWidget {
  final List<Ingredients> ingredients;
  const IngredientsListWidget({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ProductDetailContenWidget(
      childPadding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      title: "Ingredients",
      child: SizedBox(
        height: size.width * 0.30,
        width: size.width,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: ingredients.length,
          shrinkWrap: false,
          padding: const EdgeInsets.only(left: 24),
          separatorBuilder: (_, i) => const SizedBox(
            width: 10,
          ),
          itemBuilder: (_, i) {
            return IngredientsItemWidget(
              ingredients: ingredients[i],
            );
          },
        ),
      ),
    );
  }
}
