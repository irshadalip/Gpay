import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
            bottom: -50,left: -20,
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
