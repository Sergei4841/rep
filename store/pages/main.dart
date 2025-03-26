import 'package:flutter/material.dart';

import 'package:smartstore/design/colors.dart';
import 'package:smartstore/pages/basket.dart';
import 'package:smartstore/pages/basketcheck.dart';
import 'package:smartstore/pages/basketnocheck.dart';
import 'package:smartstore/pages/consult.dart';
import 'package:smartstore/pages/home.dart';
import 'package:smartstore/pages/login.dart';
import 'package:smartstore/pages/register.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: primaryColor,
    ),
    initialRoute: '/R',
    routes: {
      '/H': (context) => Home(),
      '/B': (context) => Basket(),
      '/BC': (context) => BasketChecked(),
      '/BNC': (context) => BasketNotChecked(),
      '/C': (context) => const Consult(),
      '/R': (context) => Register(),
      '/L': (context) => LoginPage(),
    },
  ),
);
