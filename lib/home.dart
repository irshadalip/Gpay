import 'dart:math';

import 'package:Gpay/models/airtime.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models/product.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  double widthOfContainer;
  final widgetOptions = [
    Text('Home'),
    Text('Add Money'),
    Text('Wallet'),
    Text("Request Money"),
    Text("Transfer Money")
  ];

  ScrollController _scrollController;
  double _scrollPosition;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    Future.delayed(Duration.zero, () {
      setState(() {
        widthOfContainer = MediaQuery.of(context).size.width * 0.94;
      });
    });
  }

  var random = new Random();

  Color colorChange(int index) {
    Color irColor = Colors.blueAccent;
    // if (recentList[index].colorSet == false) {
    int colorNum = random.nextInt(8);
    if (colorNum == 0) {
      irColor = Colors.red;
    } else if (colorNum == 1) {
      irColor = Colors.green;
    } else if (colorNum == 2) {
      irColor = Colors.blue;
    } else if (colorNum == 3) {
      irColor = Colors.blueGrey;
    } else if (colorNum == 4) {
      irColor = Colors.cyan;
    } else if (colorNum == 5) {
      irColor = Colors.orangeAccent;
    } else if (colorNum == 6) {
      irColor = Colors.brown;
    } else if (colorNum == 7) {
      irColor = Colors.purple;
    } else if (colorNum == 8) {
      irColor = Colors.purpleAccent;
    }

    setState(() {
      print("0000000000000000000000000000000000");
      recentList[index].colorSet = true;
    });
    // }

    return irColor;
  }

  void onTabItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void setContainerBig() {
    setState(() {
      widthOfContainer = MediaQuery.of(context).size.width;
    });
  }

  void setContainerSmall() {
    setState(() {
      widthOfContainer = MediaQuery.of(context).size.width * 0.92;
    });
  }

  Widget _getGridCard(String iamge, bool airtime) => Container(
        height: MediaQuery.of(context).size.width * 0.153,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
          children: <Widget>[
            for (var i = 0;
                i < (airtime ? airtimeList.length : loadedProducts.length);
                i++)
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(240, 243, 243, 1)),
                child: ClipRRect(
                    // borderRadius: BorderRadius.circular(500),
                    child: Image.asset(
                  airtime
                      ? (airtimeList[i].image == null
                          ? ""
                          : airtimeList[i].image)
                      : iamge,
                  scale: 1.5,
                  // fit: BoxFit.contain,
                )),
              ),
          ],
        ),
      );
  Widget _getRecentGrid() => Container(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30, top: 20),
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              childAspectRatio: 2 / 4,
              children: <Widget>[
                for (var i = 0; i < recentList.length; i++)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      // color: Color.fromRGBO(240, 243, 243, 1)
                    ),
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(500)),
                            color: recentList[i].colorSet == false
                                ? colorChange(i)
                                : colorChange(i),
                          ),
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                              // borderRadius: BorderRadius.circular(500),
                              child: Image.asset(
                            recentList[i].image == null
                                ? ""
                                : recentList[i].image,
                            fit: BoxFit.contain,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(recentList[i].name),
                        )
                      ],
                    )),
                  ),
              ],
            ),
          ),
        ),
      );
  Widget _getLableText(String text) => Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 12),
        child: Text(text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff003844))),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.asset("images/profilePic.png")),
          ),
          title: Text("Paymish"),
          actions: <Widget>[
            Container(
                height: 26,
                width: 26,
                child: Image.asset(
                  "images/qrIcon.png",
                  scale: 2,
                )),
            SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications,
                size: 30,
              ),
            )
          ],
          backgroundColor: Color(0xff003844),
          elevation: 0,
          // iconTheme: IconThemeData(color: Color(0xff003844)),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xff003844),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Utility Bill Payment Categories",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            NotificationListener<ScrollUpdateNotification>(
              onNotification: (notification) {
                // if (_scrollPosition > 20 && _scrollPosition > 12) {
                //   print(_scrollPosition);
                //   print("111111111111111111111111");
                //   setContainerBig();
                // } else if (_scrollPosition < 20 && _scrollPosition < 25) {
                //   print(_scrollPosition);
                //   print("222222222222222222");
                //   setContainerSmall();
                // }
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green,
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: widthOfContainer,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _getLableText("Airline"),
                                _getGridCard(
                                    "images/airElectricty/plane.png", false),
                                _getLableText("Electricty"),
                                _getGridCard(
                                    "images/airElectricty/bulb.png", false),
                                _getLableText("Airtime"),
                                _getGridCard("image/plane.png", true),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30,
                              left: MediaQuery.of(context).size.width * 0.04),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Recent",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2b7787))),
                          ),
                        ),
                        _getRecentGrid()
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset("images/tabIcon/home.png",
                    scale: 2,
                    color:
                        selectedIndex == 0 ? Color(0xff003844) : Colors.grey),
                title: Text(
                  'Home',
                )),
            BottomNavigationBarItem(
                icon: Image.asset("images/tabIcon/add.png",
                    scale: 2,
                    color:
                        selectedIndex == 1 ? Color(0xff003844) : Colors.grey),
                title: Text('Add Money')),
            BottomNavigationBarItem(
                icon: Image.asset("images/tabIcon/wallet.png",
                    scale: 2,
                    color:
                        selectedIndex == 2 ? Color(0xff003844) : Colors.grey),
                title: Text('Wallet')),
            BottomNavigationBarItem(
                icon: Image.asset("images/tabIcon/request.png",
                    scale: 2,
                    color:
                        selectedIndex == 3 ? Color(0xff003844) : Colors.grey),
                title: Text('Request Money')),
            BottomNavigationBarItem(
                icon: Image.asset("images/tabIcon/money.png",
                    scale: 2,
                    color:
                        selectedIndex == 4 ? Color(0xff003844) : Colors.grey),
                title: Text('Transfer Money')),
          ],
          currentIndex: selectedIndex,
          // fixedColor: Colors.grey,
          selectedItemColor: Color(0xff003844),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: onTabItemTapped,
        ));
  }
}
