import 'package:flutter/material.dart';
import './dummy_data.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  //write a function to trigger the product description
  //when the user tap on a single product id

  void _goToSingle(context, productId) {
    Navigator.of(context).pushNamed("single-product", arguments: productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List Screen'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: dummyProducts.map((singleProduct) {
          return Card(
            child: ListTile(
              onTap: () => _goToSingle(context, singleProduct["id"]),
              title: Text(singleProduct['name']),
            ),
          );
        }).toList(),
      ),
    );
  }
}
