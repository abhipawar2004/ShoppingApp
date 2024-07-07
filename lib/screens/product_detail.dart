import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_learn/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routename = '/Product-Detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ProductId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(ProductId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image(image:NetworkImage(loadedProduct.imageUrl),fit: BoxFit.cover,),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Colors.yellow.shade300
              ,
              child: Text('Price - \$${loadedProduct.price}',textAlign: TextAlign.center,style: 
            const TextStyle(fontSize: 20,color:Color(0xff2660a4)),),
            ),
            
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              color: const Color(0xff2660a4),
              child: const Text('Description',textAlign: TextAlign.center,style: 
            TextStyle(fontSize: 20,color:Colors.white),),
            ),

            Card(
              elevation: 25, 
              margin: const EdgeInsets.all(15),
              shadowColor: const Color(0xff2660a4),
              child: Text(loadedProduct.description,textAlign: TextAlign.center,style: const TextStyle(
              fontSize: 20,fontFamily: 'Detail',color: Color(0xff2660a4)
              ),
              softWrap: true),
            ),
          ],
        ),
      ),
    );
  }
}
