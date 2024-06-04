import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../provider/products.dart';

class UserProductItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserProductItems(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id);
            },
            icon: Icon(Icons.edit, color: Color.fromARGB(255, 12, 78, 129)),
          ),
          IconButton(
            onPressed: () async {
              try {
                await Provider.of<Products>(context, listen: false)
                    .deleteProduct(id);
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deleting Failed')));
              }
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ]),
      ),
    );
  }
}
