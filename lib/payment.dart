
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String userImage = "images/person.png";
  TextEditingController amount = TextEditingController();
  final amountFormeter =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  String userImage2 = null;

  double _containerWidth = 30.0;

  String userLatter = "Irshadali";

  int caseValue = 100;
  int ir = 12155454;

  Widget _getUserImages(String image) => Container(
        height: 60,
        width: 60,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: image == null
                ? Container(
                    height: 60,
                    width: 60,
                    color: Color(0xffff7200),
                    child: Center(
                        child: Text("C",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30))),
                  )
                : Image.asset(image, fit: BoxFit.fill)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003844),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.88,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _getUserImages(userImage),
                          SizedBox(width: 20),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 20),
                          _getUserImages(userImage2),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Payment Chinara Ade",
                          style: TextStyle(color: Colors.white),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "₦",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: _containerWidth,
                              child: TextField(
                                controller: amount,
                                showCursor: false,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.left,
                                onChanged: (value) {
                                  if (value.length == 5) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  }
                                  if (value.length == 0) {
                                    setState(() {
                                      _containerWidth = 30.0;
                                    });
                                  } else {
                                    setState(() {
                                      _containerWidth = value.length * 30.0;

                                      print(ir);
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "0",
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 50),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: TextField(
                          showCursor: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "what is this for?",
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                        )),
                  ],
                ),
                Expanded(child: Container()),
                InkWell(
                  // onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (context) => Home()),
                  //     (Route<dynamic> route) => false),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        "images/rightArrow.png",
                        scale: 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
