import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/widgets/app_drawer.dart';

import '../provider/products.dart';
import '../widgets/user_product_items.dart';
import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/userScreen";

  const UserProductScreen({super.key});
  Future<void> _refreshScreen(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .FetchDataAndUpdate(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _refreshScreen(context),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshScreen(context),
                    child: Consumer<Products>(
                      builder: (context, productData, _) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: productData.items.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              UserProductItems(
                                  productData.items[index].id,
                                  productData.items[index].title,
                                  productData.items[index].imageUrl),
                              const Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
