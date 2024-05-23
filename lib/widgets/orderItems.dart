import 'dart:math';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../provider/order.dart' as ord;

class OrderItems extends StatefulWidget {
  final ord.OrderItems order;
  OrderItems(this.order);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              height: min(widget.order.products.length * 20.0 + 50, 180),
              child: ListView(
                children: widget.order.products.map(
                  (prod) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(prod.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      Text('${prod.quantity}x \$${prod.price}',style: TextStyle(fontSize: 15,color: Colors.grey),),
                    ],
                  ),
                ).toList(), 
              ),
            ),
        ],
      ),
    );
  }
}
