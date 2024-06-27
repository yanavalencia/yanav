import 'package:flutter/material.dart';
import 'package:untitled2/Services/product.dart';
import 'package:untitled2/Services/menuCard.dart';
class Menu extends StatefulWidget {
  const Menu({super.key});


  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "Chaw Sisig", price: 75.00),
    Product(productName: "Chaw Samgyup", price: 75.00),
    Product(productName: "Chaw Liempo", price: 75.00),
    Product(productName: "Chaw Hungarian", price: 75.00),
    Product(productName: "Chaw Tapa",price:75.00),

];
  Widget cardTemplate(product){
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text(
          'Menu',
              style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
        ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: products.map((product) =>Menucard(product:product)).toList(),
        ),
      ),
    );
  }
}
