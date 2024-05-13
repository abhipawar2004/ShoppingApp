import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_learn/provider/products.dart';
import 'package:shopping_learn/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductData = Provider.of<Products>(context);
    final products = ProductData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider(
        create: (context) => products[index],
        child: ProductItem(
          // products[index].id, 
          // products[index].title,
          // products[index].imageUrl,
          ),
      ),
    );
  }
}
