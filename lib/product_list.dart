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
    return Container();
  }
}
