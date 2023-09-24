import 'package:flutter/material.dart';
import 'package:mod7_productlist/product.dart';

class ProductList extends StatefulWidget {
  final List<Product>
      products; // Define a parameter to accept the list of products

  ProductList(this.products);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(product: widget.products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Quantity: ${product.quantity}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
