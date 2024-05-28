import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart' show Cart;
import '../widgets/cartItems.dart';
import '../provider/order.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text('\$${cart.TotalAmount}',
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Color(0xff2660a4),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context,listen: false).addOrders(
                          cart.items.values.toList(), cart.TotalAmount);
                      cart.clear(); 
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Color(0xff2660a4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, i) => CartItems(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title),
                itemCount: cart.items.length),
          ),
        ],
      ),
    );
  }
}
