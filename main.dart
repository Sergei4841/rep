import 'package:flutter/material.dart';

import 'package:smartstore/design/colors.dart';
import 'package:smartstore/pages/basket.dart';
import 'package:smartstore/pages/home.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: primaryColor,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/B': (context) => const Basket(),
    }
  ),
);
