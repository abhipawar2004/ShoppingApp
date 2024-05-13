import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';



class ProductsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 191, 48),
        primary: true,
        title: Text('APNI DUKAN',style: TextStyle(fontFamily: 'Lato',color: Colors.white)),
        centerTitle: true,
      ),
      body: ProductGrid(),
    );
  }
}
