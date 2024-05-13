import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routename = '/Product-Detail';

  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(ProductId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
    );
  }
}
