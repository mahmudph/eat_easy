/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/user_order.dart';

extension UserOrderExtensions on List<UserOrder> {
  bool isExistproduct(String productId) {
    var data = where((e) => e.product.id == productId);
    return data.isNotEmpty;
  }

  UserOrder? getUserOrderById(String productId) {
    var isExist = isExistproduct(productId);
    if (isExist) {
      var order = where((element) => element.product.id == productId);
      return order.first;
    }
    return null;
  }

  void removeWhereProductId(String productId) {
    var isExist = isExistproduct(productId);
    if (isExist) {
      removeWhere(
        (element) => element.product.id == productId,
      );
    }
  }

  double getTotalPriceByProductId(String productId) {
    var isExist = isExistproduct(productId);
    if (isExist) {
      var product = where((element) => element.product.id == productId);
      return product.first.totalPrice;
    }
    return 0;
  }

  bool isExistUserOrder(String orderId) {
    var data = where((e) => e.id == orderId);
    return data.isNotEmpty;
  }

  UserOrder getOrderById(String orderId) {
    var data = singleWhere((e) => e.id == orderId);
    return data;
  }

  List<UserOrder> updateUserOrder(String orderId, [bool isAdd = false]) {
    var userOrder = getOrderById(orderId);
    if (!isAdd) {
      if (userOrder.numOfOrder == 1) {
        var data = where((element) => element.id != orderId);
        return List<UserOrder>.from(data);
      } else if (userOrder.numOfOrder > 1) {
        var data = map((e) {
          if (e.id == orderId) {
            return e.copyWith(
              numOfOrder: e.numOfOrder - 1,
              totalPrice: e.totalPrice - e.product.productPrice,
            );
          }
          return e;
        });
        return List<UserOrder>.from(data);
      }
    }
    var data = map((e) {
      if (e.id == orderId) {
        return e.copyWith(
          numOfOrder: e.numOfOrder + 1,
          totalPrice: e.totalPrice + e.product.productPrice,
        );
      }
      return e;
    });
    return List<UserOrder>.from(data);
  }
}
