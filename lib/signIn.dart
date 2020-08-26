import 'package:Gpay/Pager.dart';
import 'package:Gpay/home.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username;

  FocusNode _focusNodeMobile = FocusNode();
  FocusNode _focusNodePass = FocusNode();
  Color color;

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNodeMobile.dispose();
    _focusNodePass.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    mobileNoController.addListener(() {
      print(mobileNoController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -40,
            right: -55,
            child: Image.asset(
              "images/pager_p.png",
              height: MediaQuery.of(context).size.width * 0.5,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[_upperPart(), _bottumPart()],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _upperPart() {
    return Expanded(
      child: Container(
        child: Form(
            key: this._formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Image.asset(
                    "images/splash_title.png",
                    fit: BoxFit.fitWidth,
                    color: Color(0xff003844),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Color(0xff003844),
                        fontFamily: "Poppins-Regulars",
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Text(
                    "Please Provide following details to login into the system",
                    style: TextStyle(fontFamily: "Poppins-Regular")),
                TextFormField(
                    keyboardType: TextInputType.number,
                    focusNode: _focusNodeMobile,
                    textInputAction: TextInputAction.next,
                    controller: mobileNoController,
                    onFieldSubmitted: (value) {
                      _focusNodePass.requestFocus();
                    },
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff003844))),
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(
                          color: _focusNodeMobile.hasFocus
                              ? Color(0xff003844)
                              : Colors.black),
                      prefix: Container(
                        width: 100,
                        // color: Colors.black26,
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(2.0),
                                child: Image.asset(
                                  "images/nigeria_flage.png",
                                  height: 16.0,
                                  width: 24.0,
                                )),
                            Text(
                              "   (+234)",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    )),
                TextFormField(
                  obscureText: true,
                  focusNode: _focusNodePass,
                  controller: passwordController,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff003844))),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: _focusNodePass.hasFocus
                              ? Color(0xff003844)
                              : Colors.black)),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text("Forgot Password ?"),
                    )),
              ],
            )),
      ),
    );
  }

  Widget _bottumPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home())),
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.92,
              height: MediaQuery.of(context).size.width * 0.13,
              decoration: BoxDecoration(
                  color: Color(0xff003844),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Center(
                child: Text(
                  "SIGN IN",
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Dont't have an account "),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Pager()));
                  },
                  child: Text("Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),
        ),
        Text("By creating An account, you are agreeing to our"),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () => print("...Terms of Service..."),
                  child: Text("Terms Of Service",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Text(" and "),
              InkWell(
                  onTap: () => print("...Privacy Policy..."),
                  child: Text("Privacy Policy",
                      style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),
        )
      ],
    );
  }
}
