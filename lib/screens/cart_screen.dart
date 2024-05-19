import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CaartScreen extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width:10),
                  Chip(label: Text('/$${}'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
