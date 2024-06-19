import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
appBar: AppBar(
  title:Center(
    child: Text('CHAWAPP'),
  ),
     backgroundColor: Colors.pink,
),
      body: Center(
        child:Image.network('https://theskinnypot.com/wp-content/uploads/2023/03/Chow-King-Fried-Rice.jpg')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
    ),
  ));
}
