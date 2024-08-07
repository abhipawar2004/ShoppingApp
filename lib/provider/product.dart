import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  Future<void> toggleFavoriteStatus(String? token, String userId) async {
    
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    try {
      final url =
        'https://shoppingapp-c0d6f-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';
     final response= await http.put(Uri.parse(url),
          body: json.encode(isFavorite));
          if (response.statusCode>=400) {
            isFavorite = oldStatus;
      notifyListeners();
          }
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
