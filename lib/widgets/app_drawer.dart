import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/provider/auth.dart';

import '../screens/order_screen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: const Text('Options'),
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: const Icon(Icons.shop),
          title: const Text('Shop'),
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.payment),
          title: const Text('Payment'),
          onTap: () {
            Navigator.of(context).pushNamed(OrderScreen.routeName);
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Manage Product'),
          onTap: () {
            Navigator.of(context).pushNamed(UserProductScreen.routeName);
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Logout'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ],
    ));
  }
}
