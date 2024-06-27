import 'package:flutter/material.dart';
import 'package:untitled2/Services/product.dart';

class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
    child: Padding(
    padding: const EdgeInsets.all(12.0),

child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: <Widget>[
Text(product.productName,
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 20.0
)
),
Text( '${product.price}'),
],
),
),
);
  }
}
