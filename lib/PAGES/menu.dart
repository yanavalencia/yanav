import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled2/PAGES/selectedProduct.dart';
import 'package:untitled2/Services/product.dart';
import 'package:untitled2/Services/menuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});




  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  late Future<List<dynamic>> product;
 Future<List<dynamic>> fetchData() async{
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/product/all'));
    final data = jsonDecode(response.body);
    print(data);
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
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        title: Text(
          'Menu',
              style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
        ),
        ),
      ),
   backgroundColor: Colors.black,
   body: Container(
     child: Container(
       decoration: BoxDecoration(
         image: DecorationImage(
             image: AssetImage('assets/background.jpg'),
             fit: BoxFit.cover
         ),
       ),
       child: Padding(
         padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
         child: FutureBuilder(
           future:  product,
           builder: (context,snapshot){
             if(snapshot.connectionState== ConnectionState.waiting){
               return Center(
                 child: SpinKitChasingDots(
                  color: Colors.pinkAccent,
                  size: 60.0,
                 ),
               );
             }
             if (snapshot.hasData){
        List products =snapshot.data!;
        print(products);
        return Padding(
        padding: EdgeInsets.all(3.0),
        child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
        return Card(
        child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(products[index].productName),
        Text(products[index].price.toString())
        ],
        ),
          onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=> selectedProduct(product: products[index]),
            )
          );
          }
        ),
        );
        }

        ),
        );
        }
             return Center(
               child:  Text('Unable to load data'),
             );
           }
         ),
       ),
     ),
   ),

    );
  }
}
