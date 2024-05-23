import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/order.dart' show Orders;
import '../widgets/orderItems.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/Order';

  @override
  Widget build(BuildContext context) {
    final OrderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
        backgroundColor:  Color.fromARGB(255, 231, 191, 48),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: OrderData.orders.length,
        itemBuilder: (context, index) => OrderItems(OrderData.orders[index]),
      ),
    );
  }
}
