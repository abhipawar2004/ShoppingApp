import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderData=Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title:Text('Your Order'),
       ),
       body: ListView.builder(itemCount: OrderData.orders.length,
       itemBuilder:(context, index) =>  ),
    );
  }
}