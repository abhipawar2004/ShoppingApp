import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/provider/product.dart';
import 'package:shopping_learn/screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;
  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routename,
                  arguments: product.id);
            },
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
        footer: GridTileBar(
          leading: IconButton(
            onPressed: () {
              product.toggleFavoriteStatus();
            },
            icon: Icon(product.isFavorite ? Icons.favorite:Icons.favorite_border_outlined, color: Colors.red),
          ),
          backgroundColor: Colors.black87,
          title: Text(product.title, textAlign: TextAlign.center),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
