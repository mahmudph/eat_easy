/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/list_product_extensions.dart';
import 'package:uuid/uuid.dart';

enum ProductType {
  drink,
  eat,
  disrt,
}

class ProductToppings {
  final double price;
  final String name;
  ProductToppings({
    required this.price,
    required this.name,
  });
}

List<ProductToppings> listToppings = [
  ProductToppings(
    name: "Extra eggs",
    price: 4.25,
  ),
  ProductToppings(
    name: "Extra spinach",
    price: 2.80,
  ),
  ProductToppings(
    name: "Extra bread",
    price: 1.80,
  ),
  ProductToppings(
    name: "Extra tomato",
    price: 2.10,
  ),
  ProductToppings(
    name: "Extra cucumber",
    price: 1.60,
  ),
  ProductToppings(
    name: "Extra olives",
    price: 3.50,
  ),
  ProductToppings(
    name: "Extra pepper",
    price: 1.50,
  ),
  ProductToppings(
    name: "Extra avocado",
    price: 5.25,
  ),
];

class Ingredients {
  final String name;
  final String iconPath;
  Ingredients({
    required this.name,
    required this.iconPath,
  });
}

List<Ingredients> listIngredients = [
  Ingredients(
    iconPath: "lib/assets/icons/salad.png",
    name: "Salat",
  ),
  Ingredients(
    iconPath: "lib/assets/icons/avocado.png",
    name: "Salat",
  ),
  Ingredients(
    iconPath: "lib/assets/icons/egg.png",
    name: "Egg",
  ),
  Ingredients(
    iconPath: "lib/assets/icons/egg.png",
    name: "Eggs",
  ),
];

class CompositionSize {
  final String name;
  final String value;
  CompositionSize({
    required this.name,
    required this.value,
  });
}

List<CompositionSize> compositionSize = [
  CompositionSize(
    name: "kcal",
    value: "400",
  ),
  CompositionSize(
    name: "grams",
    value: "530",
  ),
  CompositionSize(
    name: "protein",
    value: "30",
  ),
  CompositionSize(
    name: "cabs",
    value: "40",
  ),
  CompositionSize(
    name: "fats",
    value: "30",
  ),
];

class Product {
  String id;
  String productName;
  String productDescription;
  String productImage;
  double productPrice;
  double productRatings;
  int productReviewCount;
  ProductType productType;
  List<CompositionSize> compositionSize;
  List<Ingredients> ingrediens;
  List<ProductToppings> listToppings;
  Product({
    required this.id,
    required this.productName,
    required this.productType,
    required this.productImage,
    required this.productPrice,
    required this.productRatings,
    required this.productReviewCount,
    required this.compositionSize,
    required this.ingrediens,
    required this.productDescription,
    required this.listToppings,
  });
}

List<Product> productList = [
  Product(
    id: const Uuid().v4(),
    productName: 'Avocado and Egg Toast',
    productPrice: 10.40,
    productRatings: 4.9,
    productReviewCount: 120,
    productType: ProductType.eat,
    productImage: 'lib/assets/images/products/product1.png',
    productDescription:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    compositionSize: compositionSize,
    ingrediens: listIngredients,
    listToppings: listToppings,
  ),
  Product(
    id: const Uuid().v4(),
    productName: 'Mac and Cheese',
    productPrice: 10.40,
    productRatings: 4.9,
    productReviewCount: 120,
    productType: ProductType.eat,
    productImage: 'lib/assets/images/products/product2.png',
    productDescription:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    compositionSize: compositionSize,
    ingrediens: listIngredients,
    listToppings: listToppings,
  ),
  Product(
    id: const Uuid().v4(),
    productName: 'Power bowl',
    productPrice: 10.40,
    productRatings: 4.9,
    productReviewCount: 120,
    productType: ProductType.eat,
    productImage: 'lib/assets/images/products/product3.png',
    productDescription:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    compositionSize: compositionSize,
    ingrediens: listIngredients,
    listToppings: listToppings,
  ),
  Product(
    id: const Uuid().v4(),
    productName: 'Vegetable Salad',
    productPrice: 10.40,
    productRatings: 4.9,
    productReviewCount: 120,
    productType: ProductType.eat,
    productImage: 'lib/assets/images/products/product3.png',
    productDescription:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    compositionSize: compositionSize,
    ingrediens: listIngredients,
    listToppings: listToppings,
  ),
  Product(
    id: const Uuid().v4(),
    productName: 'Vegetable Salad small',
    productPrice: 10.40,
    productRatings: 4.9,
    productReviewCount: 120,
    productType: ProductType.eat,
    productImage: 'lib/assets/images/products/product4.png',
    productDescription:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    compositionSize: compositionSize,
    ingrediens: listIngredients,
    listToppings: listToppings,
  ),
  Product(
    id: const Uuid().v4(),
    productName: 'Juice Salad small',
    productPrice: 10.40,
    productRatings: 4.9,
    productReviewCount: 120,
    productType: ProductType.drink,
    productImage: 'lib/assets/images/products/product4.png',
    productDescription:
        "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ",
    compositionSize: compositionSize,
    ingrediens: listIngredients,
    listToppings: listToppings,
  ),
];

List<Product> productRecomendation = productList.randomRecomendation();
