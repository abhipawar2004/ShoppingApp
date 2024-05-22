import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/provider/cart.dart';
import './cart_screen.dart';

import '../widgets/product_grid.dart';

enum FilterOption { FavoriteOnly, All }

class ProductsOverview extends StatefulWidget {
  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 191, 48),
        primary: true,
        title: Text('APNI DUKAN',
            style: TextStyle(fontFamily: 'Lato', color: Colors.white)),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOption selectedValue) {
                setState(
                  () {
                    if (selectedValue == FilterOption.FavoriteOnly) {
                      _showOnlyFavorite = true;
                    } else {
                      _showOnlyFavorite = false;
                    }
                  },
                );
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Favorite Items'),
                      value: FilterOption.FavoriteOnly,
                    ),
                    PopupMenuItem(
                      child: Text('All Items'),
                      value: FilterOption.All,
                    )
                  ]),
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
      body: ProductGrid(_showOnlyFavorite),
    );
  }
}
