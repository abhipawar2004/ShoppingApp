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
            Container(
              width: double.infinity,
              color: Colors.yellow.shade300
              ,
              child: Text('Price - \$${loadedProduct.price}',textAlign: TextAlign.center,style: 
            TextStyle(fontSize: 20,color:Color(0xff2660a4)),),
            ),
            
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              color: Color(0xff2660a4),
              child: Text('Description',textAlign: TextAlign.center,style: 
            TextStyle(fontSize: 20,color:Colors.white),),
            ),

            Card(
              elevation: 25, 
              margin: EdgeInsets.all(15),
              shadowColor: Color(0xff2660a4),
              child: Text(loadedProduct.description,textAlign: TextAlign.center,style: TextStyle(
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
