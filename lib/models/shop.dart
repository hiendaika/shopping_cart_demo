import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping_cart_demo/models/product.dart';

class Shop extends ChangeNotifier {
  // product for sale
  final List<Product> _products = [
    Product(
      name: 'Product 1',
      price: 7.5,
      description: 'Product 1 description.... More description .......',
      imagePath: 'assets/adidas.png',
    ),
    Product(
      name: 'Product 2',
      price: 8.5,
      description: 'Product 2 description.... More description .......',
      imagePath: 'assets/airjordan.png',
    ),
    Product(
      name: 'Product 3',
      price: 9.5,
      description: 'Product 3 description.... More description .......',
      imagePath: 'assets/converse.png',
    ),
    Product(
      name: 'Product 4',
      price: 10.5,
      description: 'Product 4 description.... More description .......',
      imagePath: 'assets/lebron.png',
    ),
    Product(
      name: 'Product 5',
      price: 11.5,
      description: 'Product 5 description.... More description .......',
      imagePath: 'assets/shoes.png',
    ),
    Product(
      name: 'Product 6',
      price: 12.5,
      description: 'Product 6 description.... More description .......',
      imagePath: 'assets/vans.png',
    ),
  ];

  //user cart
  final List<Product> _productCart = [];

  //get product list
  List<Product> get products => _products;

  //get user cart
  List<Product> get cart => _productCart;

  //add item to cart
  void addItemToCart(Product product) {
    _productCart.add(product);
    notifyListeners();
  }

  //remove item from cart
  void removeItemCart(Product product) {
    _productCart.remove(product);
    notifyListeners();
  }
}
