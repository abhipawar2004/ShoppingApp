// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/foundation.dart';

class CartItems {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItems(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItems> _items = {};

  Map<String, CartItems> get items {
    return {..._items};
  }

  int get CountItem {
    return _items.length;
  }

  double get TotalAmount {
    var total = 0.0;
    _items.forEach((key, CartItems) {
      total += CartItems.price * CartItems.quantity;
    });
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItems(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItems(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void addItems(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItems) => CartItems(
              id: existingItems.id,
              title: existingItems.title,
              price: existingItems.price,
              quantity: existingItems.quantity + 1));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItems(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
    notifyListeners();
  }
}
