/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/product_data.dart';

extension ProductListTopping on List<ProductToppings> {
  bool isExistTopping(String topingName) {
    var data = where((e) => e.name == topingName);
    return data.isNotEmpty;
  }

  void removeToppingById(String topingName) {
    removeWhere((element) => element.name == topingName);
  }
}
