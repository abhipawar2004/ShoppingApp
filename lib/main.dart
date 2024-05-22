import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_detail.dart';
import './screens/products_overview.dart';
import './provider/products.dart';
import './screens/cart_screen.dart';
import './provider/cart.dart';
import './provider/order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ProductsOverview(),
        routes: {
          ProductDetailScreen.routename: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
