import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './dummy_data.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments;

    // find the product that matches the id passed from the productListScreen

    final product = dummyProducts.firstWhere((e) => e["id"] == productId);


    return Scaffold(
      appBar: AppBar(
        title: Text(product["name"]),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            // product name
            Text(
              "Name : ${product['name']}",
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            // product price
            Text(
              "Price : ${product['Price'].toString()}",
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            // product description
            Text(
              "Description : ${product['Description']}",
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
