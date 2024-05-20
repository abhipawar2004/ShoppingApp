import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart' show Cart;
import '../widgets/cartItems.dart';

class CaartScreen extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
          255,
          231,
          191,
          48,
        ),
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
                    backgroundColor: Color.fromARGB(255, 231, 191, 48),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Color.fromARGB(255, 231, 191, 48),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
              itemBuilder: (context, index) => CartItems(
                  cart.items[index]!.id,
                  cart.items[index]!.price,
                  cart.items[index]!.quantity,
                  cart.items[index]!.title),
              itemCount: cart.CountItem),
        ],
      ),
    );
  }
}
