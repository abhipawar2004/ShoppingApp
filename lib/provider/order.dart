import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../provider/cart.dart';

class OrderItems {
  final String id;
  final double amount;
  final List<CartItems> products;
  final DateTime dateTime;

  OrderItems(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItems> _orders = [];
  final String authToken;
  final String userId;

  Orders(this.authToken,this.userId,this._orders);

  List<OrderItems> get orders {
    return [..._orders];
  }

  Future<void> fetchAndUpdateOrders() async {
    final url =
        'https://shoppingapp-c0d6f-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken';
    final response = await http.get(Uri.parse(url));
    final List<OrderItems> loadedproduct = [];
    final extractData = json.decode(response.body) as Map<String, dynamic>;
    extractData.forEach((orderId, orderData) {
      loadedproduct.add(OrderItems(
        id: orderId,
        amount: orderData['amount'],
        products: (orderData['products'] as List<dynamic>)
            .map((item) => CartItems(
                id: item['id'],
                title: item['title'],
                quantity: item['quantity'],
                price: item['price']))
            .toList(),
        dateTime: DateTime.parse(orderData['dateTime']),
      ));
    });
    _orders = loadedproduct.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrders(List<CartItems> cartProduct, double total) async {
    final url =
        'https://shoppingapp-c0d6f-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken';
    final timestamp = DateTime.now();
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProduct
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );
    _orders.insert(
      0,
      OrderItems(
        id: json.decode(response.body)['name'],
        amount: total,
        products: cartProduct,
        dateTime: timestamp,
      ),
    );
    notifyListeners();
  }
}
