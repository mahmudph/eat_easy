/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'dart:math';

import 'package:eat_easy_app/ui/models/models.dart';

extension ListExtensions on List<Product> {
  List<Product> get getEatProduct {
    var filter = getProductByType(ProductType.eat);
    return filter.toList();
  }

  List<Product> get getDrinkProduct {
    var filter = getProductByType(ProductType.drink);
    return filter.toList();
  }

  List<Product> get getDisertProduct {
    var filter = getProductByType(ProductType.disrt);
    return filter.toList();
  }

  List<Product> getProductByType(ProductType type) {
    var filter = where((element) => element.productType == type);
    return filter.toList();
  }

  Product? getProductById(String id) {
    var product = where((element) => element.id == id);
    return product.isNotEmpty ? product.first : null;
  }

  List<Product> randomRecomendation() {
    var random = Random();
    return List.generate(
      4,
      (index) => this[random.nextInt(length)],
    );
  }

  bool existProductById(String id) {
    var data = where((e) => e.id == id);
    return data.isNotEmpty;
  }

  void removeOneProductById(String id) {
    var product = where((e) => e.id == id).toList();
    if (product.isNotEmpty) product.removeLast();
  }
}
