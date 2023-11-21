import 'dart:io';

import 'package:ecom_project/modules/product.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier{
  //products for sale
  final List<Product> _shop = [
    //product 1
    Product(name: 'Product 1', description: 'Item description..', price: 99.9, imagePath: 'assets/hoodie.jpg'),
    //product 2
    Product(name: 'Product 2', description: 'Item description..', price: 59.77, imagePath: 'assets/sunglass.jpg'),
    //product 3
    Product(name: 'Product 3', description: 'Item description..', price: 66.99, imagePath: 'assets/bag.jpg'),
    //product 4
    Product(name: 'Product 4', description: 'Item description..', price: 88.9, imagePath: 'assets/shoes.jpg'),
  ];

  //star cart
List<Product> _cart =[];

//get product list
List<Product> get shop => _shop;

//get user cart
List<Product> get cart => _cart;

//add item to cart
void addToCart(Product item) {
  _cart.add(item);
  notifyListeners();
}

//remove item from cart
void removeFromCart(Product item) {
  _cart.remove(item);
  notifyListeners();
}
}
