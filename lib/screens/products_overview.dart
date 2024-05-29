import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

import './cart_screen.dart';

import '../widgets/product_grid.dart';
import '../widgets/app_drawer.dart';

class ProductsOverview extends StatefulWidget {
  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('APNI DUKAN'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                
                _showOnlyFavorite = !_showOnlyFavorite;

              });
            },
            icon: Icon(
              _showOnlyFavorite
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
            ),
          ),
          Consumer<Cart>(
            builder: (_, cart, child) =>
                Badge.count(count: cart.CountItem, child: child),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFavorite),
    );
  }
}
