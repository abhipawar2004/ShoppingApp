import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../provider/products.dart';

class UserProductItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const UserProductItems(this.id, this.title, this.imageUrl, {super.key});
  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id);
            },
            icon: const Icon(Icons.edit, color: Color.fromARGB(255, 12, 78, 129)),
          ),
          IconButton(
            onPressed: () async {
              try {
                await Provider.of<Products>(context, listen: false)
                    .deleteProduct(id);
                    scaffold.showSnackBar(const SnackBar(content: Text('Item deleted',textAlign: TextAlign.center,style: TextStyle(color: Colors.red)),backgroundColor: Colors.white,));
              } catch (error) {
                
                    scaffold.showSnackBar(const SnackBar(content: Text('Deleting Failed',textAlign: TextAlign.center,)));
              }
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ]),
      ),
    );
  }
}
