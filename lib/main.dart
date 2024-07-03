import 'package:flutter/material.dart';
import 'package:untitled2/PAGES/signup.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/PAGES/dashboard.dart';
import 'package:untitled2/PAGES/login.dart';


import 'PAGES/menu.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/menu',
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' :(context) => Menu(),
    '/profile' :(context) => Home(),
    '/signup':(context) =>Signup(),
    '/login':(context) =>Login(),
  },
));



