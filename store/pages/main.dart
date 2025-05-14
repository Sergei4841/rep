import 'package:flutter/material.dart';

import 'package:smartstore2/design/colors.dart';
import 'package:smartstore2/pages/basket.dart';
import 'package:smartstore2/pages/basketcheck.dart';
import 'package:smartstore2/pages/basketnocheck.dart';
import 'package:smartstore2/pages/consult.dart';
import 'package:smartstore2/pages/home.dart';
import 'package:smartstore2/pages/login.dart';
import 'package:smartstore2/pages/register.dart';
import 'package:smartstore2/pages/profilepage.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        initialRoute: '/C',
        routes: {
          '/H': (context) => Home(),
          '/B': (context) => Basket(),
          '/BC': (context) => BasketChecked(),
          '/BNC': (context) => BasketNotChecked(),
          '/C': (context) => const Consult(),
          '/R': (context) => Register(),
          '/L': (context) => LoginPage(),
          'PP': (context) => ProfilePage(),
        },
      ),
    );
