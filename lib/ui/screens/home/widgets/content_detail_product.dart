/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/product_data.dart';
import 'package:eat_easy_app/ui/widgets/Ingredients_list_widget.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ContentDetailProduct extends StatelessWidget {
  final Product product;
  const ContentDetailProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      constraints: BoxConstraints(
        minHeight: size.height,
      ),
      decoration: const BoxDecoration(
        color: Color(0xffFCFCFC),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(30),
          right: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _swapIndicator(size),
            headerImageContent(context, size),
            contentDataWidget(context, size),
          ],
        ),
      ),
    );
  }

  Widget _headerProductWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            product.productName,
            style: const TextStyle(
              color: Color(0xff32324D),
              fontWeight: FontWeight.bold,
              fontFamily: "Mulish",
              fontSize: 18,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ProductPrice(
          productPrice: product.productPrice,
          fontSize: 20,
        ),
      ],
    );
  }

  Widget contentDataWidget(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _headerProductWidget(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            child: Text(
              product.productDescription,
              style: const TextStyle(
                color: Color(0xff8E8EA9),
                fontFamily: "Mulish",
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 24,
            ),
            child: ProductCompositionWidget(
              compositionSize: product.compositionSize,
            ),
          ),
          IngredientsListWidget(
            ingredients: product.ingrediens,
          ),
          ListProductToppingsWidget(
            productId: product.id,
            listToppings: product.listToppings,
          ),
          ListProductRecomendationWiget(
            productId: product.id,
            recomendationProduct: productRecomendation,
          ),
          OrderProductMessageWidget(
            productId: product.id,
          ),
        ],
      ),
    );
  }

  Widget headerImageContent(BuildContext context, Size size) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.35,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: size.width,
                height: size.width * 0.6,
                child: Image.asset(
                  "lib/assets/icons/round_efect.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: size.width * 0.5,
                height: size.width * 0.5,
                child: Image.asset(
                  product.productImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          _clipReviewCount()
        ],
      ),
    );
  }

  Widget _clipReviewCount() {
    return Positioned(
      top: 50,
      right: 40,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Color(0xffFFB01D),
                size: 17,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  product.productRatings.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8E8EA9),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _swapIndicator(Size size) {
    return Container(
      width: size.width * 0.45,
      height: 6,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffC0C0CF),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
