// import 'package:provider/provider.dart';
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

  void addItems(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItems) => CartItems(
              id: existingItems.id,
              title: existingItems.title,
              quantity: existingItems.quantity,
              price: existingItems.price + 1));
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
  }
}