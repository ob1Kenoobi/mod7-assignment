import 'package:flutter/material.dart';
import 'package:mod7_productlist/product.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage(this.products);

  @override
  Widget build(BuildContext context) {
    // Calculate the total number of products bought by the user
    int totalProductsBought =
        products.where((product) => product.quantity > 0).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Products Bought: $totalProductsBought'),
          ],
        ),
      ),
    );
  }
}
