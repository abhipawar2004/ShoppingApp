// import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class CartItems {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItems({required this.id, required this.title,required this.quantity,required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, CartItems> _items;

  Map<String, CartItems> get _items {
    return {..._items};
  }
  void addItems(String productId, double price, String title)
  {
    if(_items.containsKey(productId)){
        //
    }else{
        //
    }



  }
}
