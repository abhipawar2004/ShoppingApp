import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/order.dart' show Orders;
import '../widgets/orderItems.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/Order';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isloading = false;
  @override
  void initState() {
   
        _isloading = true;
      Provider.of<Orders>(context, listen: false).fetchAndUpdateOrders().then((_){
         setState(() {
        _isloading = false;
      });
      } );
     
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final OrderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      drawer: const AppDrawer(),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: OrderData.orders.length,
              itemBuilder: (context, index) =>
                  OrderItems(OrderData.orders[index]),
            ),
    );
  }
}
