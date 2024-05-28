import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  CartItems(this.id,this.productId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(context: context, builder:(context) => AlertDialog(
          elevation: 5,
          title: Text('Are you sure?',style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text('Do you want to remove items from this cart?'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('No',style: TextStyle(color: Color.fromARGB(255, 231, 191, 48)),),),
            TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text('Yes',style: TextStyle(color: Colors.red)),),
          ],
        ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        child: Padding(
            padding: EdgeInsets.all(15),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xff2660a4),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                      child: Text(
                    '\$$price',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  )),
                ),
              ),
              title: Text(title),
              subtitle: Text('Total: \$${(price * quantity)}'),
              trailing: Text('$quantity x'),
            ),),
      ),
    );
  }
}
