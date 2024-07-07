// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  const CartItems(this.id, this.productId, this.price, this.quantity, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        child: const Icon(Icons.delete, color: Colors.white, size: 40),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  elevation: 5,
                  title: const Text(
                    'Are you sure?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: const Text('Do you want to remove items from this cart?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text(
                        'No',
                        style: TextStyle(
                            color: Color(0xff2660a4),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                            color: Color(0xff2660a4),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xff2660a4),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                    child: Text(
                  '\$$price',
                  style: const TextStyle(fontSize: 35, color: Colors.white),
                )),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
