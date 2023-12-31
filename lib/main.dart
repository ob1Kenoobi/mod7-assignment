import 'package:flutter/material.dart';
import 'package:mod7_productlist/product_data.dart';
import 'package:mod7_productlist/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ProductList(products),
    );
  }
}
