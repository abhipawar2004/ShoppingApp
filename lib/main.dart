import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/provider/cart.dart';

import 'package:shopping_learn/screens/product_detail.dart';
import 'package:shopping_learn/screens/products_overview.dart';
import 'provider/products.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (context) => Products(),),
      ChangeNotifierProvider(create: (context) => Cart()),
      
    ],
      
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ProductsOverview(),
        routes: {
          ProductDetailScreen.routename:(context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
