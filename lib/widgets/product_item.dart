import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/provider/cart.dart';
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
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

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
          leading: Consumer<Product>(
            builder: (context, value, _) => IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              icon: Icon(
                product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: Colors.blueAccent,
              ),
            ),
          ),
          backgroundColor: Colors.black54,
          title: Text(product.title, textAlign: TextAlign.center),
          trailing: IconButton(
            onPressed: () {
              cart.addItems(product.id, product.price, product.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  
                  content: Text('Added items to the cart!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'undo',
                    onPressed: () {
                      cart.removeSingleItems(product.id);
                      
                    },
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
