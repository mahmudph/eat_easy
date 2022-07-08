/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/models.dart';
import 'package:flutter/material.dart';

import 'product_price_widget.dart';
import 'toggle_order_action_widget.dart';

class ListItemProductWidget extends StatelessWidget {
  final Product product;
  final bool withCountingNumItem;
  final void Function(String) onPress;
  final VoidCallback? onPressAdd;
  final VoidCallback? onPressRemove;
  final int numOfOrder;
  final double? price;

  const ListItemProductWidget({
    Key? key,
    this.withCountingNumItem = false,
    required this.onPress,
    required this.product,
    this.onPressAdd,
    this.onPressRemove,
    this.price,
    this.numOfOrder = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onPress(product.id),
      child: Container(
        height: size.width * 0.3,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0, 4),
              spreadRadius: 1,
            )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  product.productImage,
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      product.productName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Mulish",
                        color: Color(0xff32324D),
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  reviewContenWidget(),
                  ProductPrice(
                    productPrice: price ?? product.productPrice,
                  )
                ],
              ),
            ),
            if (withCountingNumItem)
              ToggleOrderActionWidget(
                onPressAdd: onPressAdd,
                onPressRemove: onPressRemove,
                numOfOrder: numOfOrder,
              )
          ],
        ),
      ),
    );
  }

  Widget reviewContenWidget() {
    return Row(
      children: [
        const Icon(
          Icons.star_half,
          color: Color(0xffFFB01D),
          size: 15,
        ),
        RichText(
          text: TextSpan(
            text: product.productRatings.toString(),
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "Mulish",
              color: Color(0xff8E8EA9),
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: "${product.productReviewCount} Reviews",
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "Mulish",
                  color: Color(0xffC0C0CF),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
