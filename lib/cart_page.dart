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
    int totalQuantity = 0;
    for (Product product in products) {
      totalQuantity += product.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Products Bought:',
              style: TextStyle(
                fontSize: 24, // Increase font size
                fontWeight: FontWeight.bold,
                color: Colors.purple, // Apply bold style
              ),
            ),
            Text(
              '$totalProductsBought',
              style: TextStyle(
                fontSize: 36, // Increase font size
                fontWeight: FontWeight.bold,
                color: Colors.purple, // Apply bold style
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Total Quantity of the Products:',
              style: TextStyle(
                fontSize: 24, // Increase font size
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, // Apply bold style
              ),
            ),
            Text(
              '$totalQuantity',
              style: TextStyle(
                fontSize: 36, // Increase font size
                fontWeight: FontWeight.bold, // Apply bold style
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
