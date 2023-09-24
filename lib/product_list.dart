import 'package:flutter/material.dart';
import 'package:mod7_productlist/product.dart';
import 'package:mod7_productlist/cart_page.dart';
import 'package:mod7_productlist/product_data.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  ProductList(this.products);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  void updateProductQuantity(int index) {
    setState(() {
      widget.products[index].quantity++;
    });
  }

  void _showCongratulationsDialog(String productName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You\'ve bought 5 $productName!'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Product List'),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return ProductCard(
            product: product,
            onBuyNowPressed: () {
              updateProductQuantity(index);
              if (product.quantity == 5) {
                _showCongratulationsDialog(product.name);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the shopping cart action here
          // For example, navigate to the cart page
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CartPage(products),
          ));
        },
        child: Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // Position the FAB at the bottom right
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onBuyNowPressed;

  ProductCard({required this.product, required this.onBuyNowPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                Text('Price: \$${product.price.toStringAsFixed(2)}'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Quantity: ${product.quantity.toString()}'),
                ElevatedButton(
                  onPressed: onBuyNowPressed,
                  child: Text('Buy Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
