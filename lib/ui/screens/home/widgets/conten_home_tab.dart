/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/context_extension.dart';
import 'package:eat_easy_app/extensions/list_product_extensions.dart';
import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/models/product_data.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'content_detail_product.dart';

class ContenHomeTab extends StatelessWidget {
  final List<Product> item;
  const ContenHomeTab({
    Key? key,
    required this.item,
  }) : super(key: key);

  void handlOnTapProductItem(BuildContext context, String id) async {
    var provider = Provider.of<AppStorage>(context, listen: false);
    var product = item.getProductById(id);
    if (product != null) {
      provider.cleanPreOrder();
      await context.showBottomSheetProductDetail(
        ContentDetailProduct(product: product),
        product,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (item.isEmpty) {
      return showEmptyWidget(context);
    }
    return ListView.separated(
      separatorBuilder: (_, i) => const SizedBox(height: 10),
      itemCount: item.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return ListItemProductWidget(
          product: item[index],
          onPress: (id) => handlOnTapProductItem(context, id),
        );
      },
    );
  }

  Widget showEmptyWidget(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: HeaderCaptionWidget(
        title: "Product is empty",
        subTitle: "No product found, please refresh another time",
      ),
    );
  }
}
