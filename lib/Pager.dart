import 'package:Gpay/models/slide.dart';
import 'package:Gpay/payment.dart';
import 'package:Gpay/signIn.dart';
import 'package:Gpay/signUp.dart';
import 'package:Gpay/widgets/slideItems.dart';
import 'package:flutter/material.dart';
import 'package:Gpay/widgets/sliderDots.dart';

import 'dart:async';

class Pager extends StatefulWidget {
  @override
  _PagerState createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              right: -65,
              child: Image.asset(
                "images/pager_p.png",
                height: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            Positioned(
              bottom: -30,
              left: 0,
              child: Image.asset(
                "images/bottum_p.png",
                height: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            Positioned.fill(
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          itemCount: slidelist.length,
                          onPageChanged: _onPageChange,
                          itemBuilder: (context, i) => SlideItem(i),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 55),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < slidelist.length; i++)
                              if (i == _currentPage)
                                SliderDots(true)
                              else
                                SliderDots(false)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            print("...LOG IN WITH FINGERPRINT...");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payment()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: MediaQuery.of(context).size.width * 0.13,
                            decoration: BoxDecoration(
                                color: Color(0xff003844),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            child: Center(
                              child: Text(
                                "LOG IN WITH FINGERPRINT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Coves",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40, top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: MediaQuery.of(context).size.width * 0.13,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  print("...Sign In...");
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.width * 0.13,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Color(0xff003844)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: Text("Sign In",
                                        style: TextStyle(
                                            color: Color(0xff003844),
                                            fontFamily: "Poppins")),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("...Sign Up...");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp(),
                                          settings: RouteSettings(
                                              name: '/PagerPage')));
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: MediaQuery.of(context).size.width *
                                        0.13,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: Color(0xff003844)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Center(
                                      child: Text("Sign Up",
                                          style: TextStyle(
                                              color: Color(0xff003844),
                                              fontFamily: "Poppins-Regular")),
                                    )),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
