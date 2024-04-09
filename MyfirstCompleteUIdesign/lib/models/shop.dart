import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: 'Onion',
        price: '80.00',
        imagePath: 'assets/onion.png',
        rating: '5.5',
        description: 'bombay'),
    Food(
        name: 'Tomato ',
        price: '30.00',
        imagePath: 'assets/tomato.png',
        rating: '5.5',
        description: 'kamatis'),
    Food(
        name: 'Cabbage ',
        price: '30.00',
        imagePath: 'assets/tomato.png',
        rating: '5.5',
        description: 'repolyo'),
    Food(
        name: 'Potato ',
        price: '30.00',
        imagePath: 'assets/tomato.png',
        rating: '5.5',
        description: 'ambot ah'),
  ];
  List<Food> _cart = [];

//getters
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food fooditem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(fooditem);
    }
    notifyListeners();
  }

  void removeFromCart(Food fooditem) {
    _cart.remove(fooditem);
    notifyListeners();
  }
}
