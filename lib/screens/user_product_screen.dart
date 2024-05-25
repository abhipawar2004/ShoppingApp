import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/widgets/app_drawer.dart';

import '../provider/products.dart';
import '../widgets/user_product_items.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/userScreen";
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              // Do Something Here
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (context, index) => Column(
            children: [
              UserProductItems(productData.items[index].title,
                  productData.items[index].imageUrl),
                  Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
