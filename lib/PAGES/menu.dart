import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled2/Services/product.dart';
import 'package:untitled2/Services/menuCard.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({super.key});




  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  late Future<List<dynamic>> product;
 Future<List<dynamic>> fetchData() async{
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/products'));
    final data = jsonDecode(response.body);
    List products =<Product>[];
    for (var product in data){
      products.add(Product.fromJson(product));
    }
    return products;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   product = fetchData();
  }


  @override
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
        foregroundColor: Colors.blueGrey,
        title: Text(
          'Menu',
              style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
        ),
        ),
      ),

    );
  }
}
