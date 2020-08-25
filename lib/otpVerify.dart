import 'dart:async';

import 'package:Gpay/signIn.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OtpVerify extends StatefulWidget {
  var mobileNumber = '+234 95364 25643';

  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  Timer _timer;
  static const _kInputHeight = 64.0;
  static final int _pinLength = 4;
  bool _enable = true;

  TextEditingController _pinEditingController = TextEditingController(text: '');
  PinDecoration _pinDecoration = UnderlineDecoration(
    enteredColor: Color(0xff003844),
    // hintText: _kDefaultHint,
  );

  void initState() {
    _startTimer();
    super.initState();
  }

  int _counter = 300;
  void _startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back, color: Color(0xff003844))),
                ),
                Text(
                  "Verify",
                  style: TextStyle(
                      color: Color(0xff003844),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text("Please entered the OTP receivev on your phone",
                      style: TextStyle(color: Color(0xff202126), fontSize: 16)),
                ),
                Text("Enter the code sent on ${widget.mobileNumber}",
                    style: TextStyle(color: Color(0xff5D5B6F), fontSize: 16)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    child: SizedBox(
                      height: _kInputHeight,
                      child: PinInputTextField(
                        pinLength: _pinLength,
                        decoration: _pinDecoration,
                        controller: _pinEditingController,
                        textInputAction: TextInputAction.go,
                        enabled: _enable,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.characters,
                        onSubmit: (pin) {
                          debugPrint('submit pin:$pin');
                        },
                        onChanged: (pin) {
                          debugPrint('onChanged execute. pin:$pin');
                        },
                        enableInteractiveSelection: true,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Expires in:  "),
                        Text(
                          '${(_counter ~/ 60).toInt()}:${_counter % 60}',
                        )
                      ],
                    ),
                    Text("Resend ?")
                  ],
                ),
              ],
            ),
            InkWell(
              // onTap: () => Navigator.popUntil(
              //     context, ModalRoute.withName('/PagerPage')),

              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SignIn()),
                  (Route<dynamic> route) => false),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.13,
                  decoration: BoxDecoration(
                      color: Color(0xff003844),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Center(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Coves",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
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
