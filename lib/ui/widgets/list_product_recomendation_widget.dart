/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_detail_conten_widget.dart';
import 'list_item_product.dart';

class ListProductRecomendationWiget extends StatelessWidget {
  final List<Product> recomendationProduct;
  final String productId;
  const ListProductRecomendationWiget({
    Key? key,
    required this.productId,
    required this.recomendationProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AppStorage>(context, listen: false);
    return ProductDetailContenWidget(
      title: "Recomendations Sides",
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) {
          return ListItemProductWidget(
            onPress: (id) {},
            onPressAdd: () {
              prov.setPreOrderOtherProd(
                productId,
                recomendationProduct[i],
                true,
              );
            },
            onPressRemove: () {
              prov.setPreOrderOtherProd(
                productId,
                recomendationProduct[i],
                false,
              );
            },
            withCountingNumItem: true,
            product: recomendationProduct[i],
          );
        },
        separatorBuilder: (_, i) => const SizedBox(
          height: 5,
        ),
        itemCount: recomendationProduct.length,
      ),
    );
  }
}
