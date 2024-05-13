import 'package:flutter/material.dart';

import 'product.dart';


class Products with ChangeNotifier {
   final List<Product> _items = [
     Product(
      id: 'p1',
      title: 'Dress',
      description: 'A white dress - it is pretty white!',
      price: 3280,
      imageUrl:'https://cdn.pixabay.com/photo/2016/11/11/18/42/business-1817472_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'footwears',
      description: 'A designing women footwear.',
      price: 1290,
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/08/08/16/17/shoes-3592530_1280.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Shirts',
      description: 'A nice pair of shirt.',
      price: 500,
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/08/26/21/48/shirts-428600_1280.jpg',
    ),
    Product(
        id: 'p4',
        title: 'T-shirt',
        description: 'A nice pair of T-shirt.',
        price: 450,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/26/19/12/morning-1772286_1280.jpg'),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id){
    return _items.firstWhere((prod) => prod.id == id);
  }


  void addProducts() {
    // _items.add(value)
    notifyListeners();
  }
}
