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

import 'product_price_widget.dart';

class ProductToppingItemWidget extends StatefulWidget {
  final String productId;
  final ProductToppings toppings;

  const ProductToppingItemWidget({
    Key? key,
    required this.productId,
    required this.toppings,
  }) : super(key: key);

  @override
  State<ProductToppingItemWidget> createState() =>
      _ProductToppingItemWidgetState();
}

class _ProductToppingItemWidgetState extends State<ProductToppingItemWidget> {
  late ValueNotifier<bool> userTopping;

  @override
  void initState() {
    super.initState();
    userTopping = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    userTopping.dispose();
    super.dispose();
  }

  void handleOnTapTapping(AppStorage prov) {
    userTopping.value = !userTopping.value;
    prov.setPreOrderToppings(
      widget.productId,
      widget.toppings,
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppStorage>(context, listen: false);
    return InkWell(
      onTap: () => handleOnTapTapping(provider),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: userTopping,
              builder: (_, state, __) {
                return Checkbox(
                  value: state,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  activeColor: const Color(0xffC0C0CF),
                  checkColor: Colors.white,
                  onChanged: (e) {
                    handleOnTapTapping(provider);
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.toppings.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Mulish",
                  color: Color(0xff32324D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            ProductPrice(
              productPrice: widget.toppings.price,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
