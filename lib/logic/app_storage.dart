/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/list_order_extensions.dart';
import 'package:eat_easy_app/extensions/list_product_extensions.dart';
import 'package:eat_easy_app/extensions/list_product_topping_extensions.dart';
import 'package:eat_easy_app/ui/models/models.dart';
import 'package:eat_easy_app/ui/models/user_order.dart';
import 'package:eat_easy_app/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AppStorage extends ChangeNotifier {
  UserData? _userData;

  List<UserOrder> _userOrder = [];
  List<UserOrder> _userPreOrder = [];

  AppStorage() {
    loadUserLogin();
  }

  UserData? get userData => _userData;
  List<UserOrder> get userOrder => _userOrder;
  List<UserOrder> get userPreOrder => _userPreOrder;

  void setUser(
    String val, {
    bool isUserEmail = false,
    bool isUserName = false,
    bool isUserMobilePhone = false,
    bool isUserPassword = false,
  }) {
    _userData ??= UserData.anonymouse();
    if (isUserEmail) {
      _userData!.userEmail = val;
    } else if (isUserName) {
      _userData!.userName = val;
    } else if (isUserMobilePhone) {
      _userData!.userMobileNumber = val;
    } else {
      _userData!.userPassword = val;
    }
  }

  void loadUserLogin() async {
    var data = await Storage.instance.loadUserLogin();
    if (data != null) {
      _userData = UserData.fromJson(data);
    }
  }

  void save() {
    if (userData != null) {
      var jsonData = _userData!.toJson();
      Storage.instance.setLoginUser();
      Storage.instance.saveUserLogin(jsonData);
    }
  }

  void setPreOrderMessage(String productId, String message) {
    var preOrder = _userPreOrder.getUserOrderById(productId);
    if (preOrder != null) {
      preOrder.message = message;
      _userPreOrder = [preOrder];
      notifyListeners();
      return;
    }
    var product = productList.getProductById(productId);
    var userOrder = UserOrder(
      id: const Uuid().v4(),
      product: product!,
      otherProduct: [],
      numOfOrder: 1,
      toppings: [],
      message: message,
      totalPrice: product.productPrice,
    );
    _userPreOrder.add(userOrder);
    notifyListeners();
  }

  void setPreOrderToppings(String productId, ProductToppings topping) {
    var preOrder = _userPreOrder.getUserOrderById(productId);
    if (preOrder != null) {
      if (preOrder.toppings.isExistTopping(topping.name)) {
        preOrder.totalPrice -= topping.price;
        preOrder.toppings.removeWhere((e) => e.name == topping.name);
        _userPreOrder = [preOrder];
        notifyListeners();
        return;
      }

      preOrder.toppings.add(topping);
      preOrder.totalPrice += topping.price;
      _userPreOrder = [preOrder];
      notifyListeners();
      return;
    }

    var product = productList.getProductById(productId);
    var userOrder = UserOrder(
      id: const Uuid().v4(),
      product: product!,
      otherProduct: [],
      numOfOrder: 1,
      toppings: [topping],
      totalPrice: topping.price,
    );
    _userPreOrder.add(userOrder);
    notifyListeners();
  }

  void setPreOrderOtherProd(String productId, Product product,
      [bool isAdd = true]) {
    var preOrder = _userPreOrder.getUserOrderById(productId);
    if (preOrder != null) {
      if (!isAdd) {
        if (preOrder.otherProduct.existProductById(product.id)) {
          preOrder.otherProduct.removeOneProductById(product.id);
          preOrder.totalPrice -= product.productPrice;
          _userPreOrder = [preOrder];
          notifyListeners();
          return;
        }
        return;
      }
      preOrder.otherProduct.add(product);
      preOrder.totalPrice += product.productPrice;
      _userPreOrder = [preOrder];
      notifyListeners();
      return;
    }

    if (isAdd) {
      var productSource = productList.getProductById(productId);
      var userOrder = UserOrder(
        id: const Uuid().v4(),
        product: productSource!,
        otherProduct: [product],
        numOfOrder: 1,
        toppings: [],
        totalPrice: productSource.productPrice,
      );
      _userPreOrder.add(userOrder);
      notifyListeners();
    }
  }

  void cancelPreOrderProd(String prodId) {
    var preOrder = _userPreOrder.getUserOrderById(prodId);
    if (preOrder != null) {
      _userPreOrder.removeWhereProductId(prodId);
      notifyListeners();
    }
  }

  double getPriceById(String productId) {
    return _userPreOrder.getTotalPriceByProductId(productId);
  }

  String? getPreOrderMessage(String productId) {
    var preOrder = _userPreOrder.getUserOrderById(productId);
    if (preOrder != null) return preOrder.message;
    return null;
  }

  List<ProductToppings> getPreOrderToppingByProductId(String productId) {
    var preOrder = _userPreOrder.getUserOrderById(productId);
    if (preOrder != null) return preOrder.toppings;
    return [];
  }

  void orderProduct(String productId, [int numOrder = 1]) {
    var product = productList.getProductById(productId);
    var preOrder = _userPreOrder.getUserOrderById(productId);
    if (preOrder != null) {
      preOrder.totalPrice += (numOrder + product!.productPrice);
      _userOrder.add(preOrder);
      notifyListeners();
      return;
    }

    var userOrder = UserOrder(
      id: const Uuid().v4(),
      product: product!,
      otherProduct: [],
      numOfOrder: numOrder,
      toppings: [],
      totalPrice: product.productPrice * numOrder,
    );
    _userOrder.add(userOrder);
    notifyListeners();
  }

  void updateOrder(String orderId, [bool isAdd = true]) {
    var data = _userOrder.updateUserOrder(orderId, isAdd);
    _userOrder = data;
    notifyListeners();
  }

  void cleanPreOrder() {
    _userPreOrder.clear();
    notifyListeners();
  }
}
