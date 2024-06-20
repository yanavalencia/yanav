import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.blueGrey,
    appBar: AppBar(
      title: Text ('User Profile'),
      backgroundColor: Colors.pinkAccent,
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'NAME',
            style:TextStyle(
              fontSize: 16.0,
              letterSpacing: 1.0,
            ) ,
          ),
          Text(
            'Yana Laurice A. Valencia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'YEAR',
            style:TextStyle(
              fontSize: 16.0,
              letterSpacing: 1.0,
            ) ,
          ),
          Text(
            '3rd Year',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'EMAIL',
            style:TextStyle(
              fontSize: 16.0,
              letterSpacing: 1.0,
            ) ,
          ),
          Text(
            'yanalaurice@gmail.com',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
        ],
      ),
    ),
  ),
));