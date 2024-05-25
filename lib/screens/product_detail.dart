import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routename = '/Product-Detail';

  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(ProductId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image(image:NetworkImage(loadedProduct.imageUrl),fit: BoxFit.cover,),
            ),
            SizedBox(height: 10),
            Text('\$${loadedProduct.price}',style: 
            TextStyle(color: Colors.grey,fontSize: 20),),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(loadedProduct.description,textAlign: TextAlign.center,
              softWrap: true),
            ),
          ],
        ),
      ),
    );
  }
}
