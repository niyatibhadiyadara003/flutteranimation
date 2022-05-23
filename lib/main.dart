import 'dart:math';

import 'package:animatorflutter/screens/bmi_page.dart';
import 'package:animatorflutter/screens/homepage.dart';
import 'package:animatorflutter/screens/planet_page.dart';
import 'package:animatorflutter/screens/single_planet_page.dart';
import 'package:animatorflutter/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash_screen',
    routes: {
      'splash_screen': (context) => const SplashScreen(),
      '/': (context) => const HomePage(),
      'bmi_page': (context) => const BmiPage(),
    },
    // initialRoute: 'planet_page',
    // routes: {
    //   'planet_page': (context) => const PlanetPage(),
    //   'single_planet_page': (context) => const SinglePlanetPage(),
    // },
  ));
}
