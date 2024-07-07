import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/auth.dart';
import './screens/splash_screen.dart';
import './screens/product_detail.dart';
import './screens/products_overview.dart';
import './provider/products.dart';
import './screens/cart_screen.dart';
import './provider/cart.dart';
import './provider/order.dart';
import './screens/order_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products('', '', []),
          update: (context, auth, previousProducts) => Products(
            auth.token ?? '', // Provide a default value if null
            auth.userId ?? '', // Provide a default value if null
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (context) => Orders('', '', []),
          update: (context, auth, previousOrders) => Orders(
            auth.token ?? '', // Provide a default value if null
            auth.userId ?? '', // Provide a default value if null
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
              iconTheme: IconThemeData(color: Colors.white),
              actionsIconTheme: IconThemeData(color: Colors.white),
              color: Color(0xff2660a4),
            ),
            primaryColor: const Color(
              0xffedf7f6,
            ),
          ),
          title: 'Flutter Demo',
          home: auth.isAuth
              ? const ProductsOverview()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (context, authResultsnapshot) {
                    if (authResultsnapshot.connectionState == ConnectionState.waiting) {
                      return const SplashScreen();
                    } else if (authResultsnapshot.data == true) {
                      return const ProductsOverview();
                    } else {
                      return const AuthScreen();
                    }
                  },
                ),
          routes: {
            ProductDetailScreen.routename: (context) => const ProductDetailScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
            OrderScreen.routeName: (context) => const OrderScreen(),
            UserProductScreen.routeName: (context) => const UserProductScreen(),
            EditProductScreen.routeName: (context) => const EditProductScreen(),
          },
        ),
      ),
    );
  }
}
