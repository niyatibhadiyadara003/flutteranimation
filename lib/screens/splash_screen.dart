import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101438),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Image.asset('assets/images/bmi.png'),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "BMI CALCULATOR",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 3,
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(
              color: Color(0xffFF0266),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Check your BMI",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
