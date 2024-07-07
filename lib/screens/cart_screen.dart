import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart' show Cart;
import '../widgets/cartItems.dart';
import '../provider/order.dart';
import 'order_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/Cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text('\$${cart.TotalAmount}',
                        style: const TextStyle(color: Colors.white)),
                    backgroundColor: const Color(0xff2660a4),
                  ),
                  cart.TotalAmount>0?
                  TextButton(
                    onPressed: () async{
                     await   Provider.of<Orders>(context,listen: false).addOrders(
                          cart.items.values.toList(), cart.TotalAmount);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushNamed(OrderScreen.routeName);
                      cart.clear(); 
                    },
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Color(0xff2660a4),
                      ),
                    ),
                  ):
                  Container(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
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
