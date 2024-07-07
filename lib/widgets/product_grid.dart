// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:shopping_learn/provider/products.dart';
import 'package:shopping_learn/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool ShowFav;
  const ProductGrid(this.ShowFav, {super.key});
  @override
  Widget build(BuildContext context) {
    final ProductData = Provider.of<Products>(context);
    final products = ShowFav?ProductData.FavoriteItems: ProductData.items;

    if (ShowFav && products.isEmpty) {
      return const Center(
        child: Text(
          'No favorite products yet!',
          style: TextStyle(fontSize: 20),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: const ProductItem(),
      ),
    );
  }
}
