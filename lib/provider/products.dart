import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Dress',
    //   description:
    //       'Dresses are one-piece garments that come in countless styles, lengths, and designs, suitable for various occasions and seasons.'
    //       'They can be crafted from an array of fabrics like cotton, silk, wool, and synthetics, each contributing to the dress\'s overall look and feel.',
    //   price: 3280,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/11/11/18/42/business-1817472_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Footwears',
    //   description:
    //       'Footwear encompasses a wide variety of shoes and related items designed to protect and comfort the human foot while providing aesthetic appeal.'
    //       'Types of footwear include sneakers, boots, sandals, loafers, heels, and more. Each type serves different purposes and caters to various fashion needs.',
    //   price: 1290,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2018/08/08/16/17/shoes-3592530_1280.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Shirts',
    //   description:
    //       'Shirts are a broad category of tops that can range from casual to formal. They are typically made from woven fabrics like cotton, linen, silk, or blends and come in numerous styles, fits, and patterns.',
    //   price: 500,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2014/08/26/21/48/shirts-428600_1280.jpg',
    // ),
    // Product(
    //     id: 'p4',
    //     title: 'T-shirts',
    //     description:
    //         'T-shirts are casual tops known for their simplicity and comfort. They come in a variety of styles, colors, and fits, making them a staple in almost everyone’s wardrobe. Typically made from cotton or cotton blends, T-shirts are breathable and easy to wear.',
    //     price: 450,
    //     imageUrl:
    //         'https://cdn.pixabay.com/photo/2016/10/26/19/12/morning-1772286_1280.jpg'),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get FavoriteItems {
    return _items.where((prodItems) => prodItems.isFavorite).toList();
  }

  Future<void> FetchData() async {
    const url =
        'https://shoppingapp-c0d6f-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProduct = [];
      extractData.forEach((prodId, prodData) {
        loadedProduct.add(
          Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
          ),
        );
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProducts(Product product) async {
    const url =
        'https://shoppingapp-c0d6f-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
          {
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'isFavorite': product.isFavorite,
          },
        ),
      );
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodind = _items.indexWhere((prod) => prod.id == id);
    final url =
        'https://shoppingapp-c0d6f-default-rtdb.firebaseio.com/products/$id.json';
    await http.patch(Uri.parse(url),
        body: json.encode({
          'title': newProduct.title,
          'price': newProduct.price,
          'description': newProduct.description,
          'imageUrl': newProduct.imageUrl
        }));
    if (prodind >= 0) {
      _items[prodind] = newProduct;
      notifyListeners();
    } else {
      print('....');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://shoppingapp-c0d6f-default-rtdb.firebaseio.com/products/$id.json';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    Product? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
