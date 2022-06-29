/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/product_data.dart';

class UserOrder {
  String id;
  Product product;
  int numOfOrder;
  double totalPrice;
  String? message;
  List<ProductToppings> toppings;
  List<Product> otherProduct;

  UserOrder({
    required this.id,
    required this.product,
    required this.otherProduct,
    required this.numOfOrder,
    required this.toppings,
    required this.totalPrice,
    this.message,
  });
}
