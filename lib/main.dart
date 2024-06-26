import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/PAGES/dashboard.dart';

import 'PAGES/menu.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' :(context) => Menu(),
    '/profile' :(context) => Home(),
  },
));



