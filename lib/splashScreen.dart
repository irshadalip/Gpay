import 'package:flutter/material.dart';
import 'dart:async';
import 'Pager.dart';

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreens> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Pager())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003844),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -40,
            right: -80,
            child: Image.asset(
              "images/splash_p.png",
              height: MediaQuery.of(context).size.width * 0.65,
              width: MediaQuery.of(context).size.width * 0.65,
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(
              "images/splash_title.png",
              fit: BoxFit.fitWidth,
            ),
          )),
          Positioned(
            bottom: -50,
            left: -20,
            child: Image.asset(
              "images/splash_p2.png",
              height: MediaQuery.of(context).size.width * 0.70,
              width: MediaQuery.of(context).size.width * 0.70,
            ),
          )
        ],
      ),
    );
  }
}
