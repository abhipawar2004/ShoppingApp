import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

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
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      cart.TotalAmount.toString(),
                    ),
                    backgroundColor: Color.fromARGB(255, 231, 191, 48),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
