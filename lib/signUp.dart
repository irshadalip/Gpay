import 'package:Gpay/otpVerify.dart';
import 'package:Gpay/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  FocusNode _focusFirstName = FocusNode();
  FocusNode _focusLastName = FocusNode();
  FocusNode _focusEmail = FocusNode();
  FocusNode _focusMobile = FocusNode();
  FocusNode _focusPass = FocusNode();
  Color color;

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusFirstName.dispose();
    _focusLastName.dispose();
    _focusEmail.dispose();
    _focusMobile.dispose();
    _focusPass.dispose();

    super.dispose();
  }

  var selectedCard = 'User';
  var showPass = true;
  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }

  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xff003844)),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              bottom: -30,
              left: 0,
              child: Image.asset(
                "images/bottum_p.png",
                height: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            SingleChildScrollView(child: _allContaint())
          ],
        ));
  }

  Widget _allContaint() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                _uperContent(),
                _centerFormWidget(),
              ],
            ),
            _bottomContent(),
          ],
        ),
      ),
    );
  }

  Widget _uperContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Create an Account",
          style: TextStyle(color: Color(0xff003844), fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Enter your basic information as it appears in your driving license to get started",
            style: TextStyle(color: Color(0xff484848).withOpacity(0.7)),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  color: Color(0xff003844),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _tabCard('User'),
                    _tabCard('Agents'),
                  ]),
            ))
      ],
    );
  }

  Widget _centerFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
              keyboardType: TextInputType.text,
              focusNode: _focusFirstName,
              textInputAction: TextInputAction.next,
              controller: firstNameController,
              onFieldSubmitted: (value) {
                _focusLastName.requestFocus();
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff003844))),
                labelText: 'First Name',
                labelStyle: TextStyle(
                    color: _focusFirstName.hasFocus
                        ? Color(0xff003844)
                        : Color(0xff5D5B6F).withOpacity(0.5)),
              )),
          TextFormField(
              keyboardType: TextInputType.text,
              focusNode: _focusLastName,
              textInputAction: TextInputAction.next,
              controller: lastNameController,
              onFieldSubmitted: (value) {
                _focusEmail.requestFocus();
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff003844))),
                labelText: 'Last Name',
                // contentPadding: EdgeInsets.symmetric(vertical: 0),
                labelStyle: TextStyle(
                    color: _focusLastName.hasFocus
                        ? Color(0xff003844)
                        : Color(0xff5D5B6F).withOpacity(0.5)),
              )),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              focusNode: _focusEmail,
              textInputAction: TextInputAction.next,
              controller: emailController,
              onFieldSubmitted: (value) {
                _focusMobile.requestFocus();
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff003844))),
                labelText: 'Email Address',
                labelStyle: TextStyle(
                    color: _focusEmail.hasFocus
                        ? Color(0xff003844)
                        : Color(0xff5D5B6F).withOpacity(0.5)),
              )),
          TextFormField(
              keyboardType: TextInputType.number,
              focusNode: _focusMobile,
              textInputAction: TextInputAction.next,
              controller: mobileController,
              onFieldSubmitted: (value) {
                _focusPass.requestFocus();
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff003844))),
                labelText: 'Mobile Number',
                labelStyle: TextStyle(
                    color: _focusMobile.hasFocus
                        ? Color(0xff003844)
                        : Color(0xff5D5B6F).withOpacity(0.5)),
              )),
          TextFormField(
              obscureText: showPass,
              focusNode: _focusPass,
              controller: passController,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () => showPassword(),
                  child: Icon(Icons.remove_red_eye,
                      color: showPass ? Colors.grey : Color(0xff003844)),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff003844))),
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: _focusPass.hasFocus
                        ? Color(0xff003844)
                        : Color(0xff5D5B6F).withOpacity(0.5)),
              )),
        ],
      ),
    );
  }

  Widget _bottomContent() {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => OtpVerify())),
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.width * 0.13,
            decoration: BoxDecoration(
                color: Color(0xff003844),
                borderRadius: BorderRadius.all(Radius.circular(3))),
            child: Center(
              child: Text(
                "NEXT",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Coves",
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Dont't have an account ",
                  style: TextStyle(
                    color: Color(0xff003844),
                    fontSize: 16,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text("Sign In",
                      style: TextStyle(
                          color: Color(0xff003844),
                          fontWeight: FontWeight.bold,
                          fontSize: 16))),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Text("Registered as an Agent",
                style: TextStyle(
                  color: Color(0xff003844),
                  fontFamily: "Poppins-Regular",
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                )),
          ),
        )
      ],
    );
  }

  Widget _tabCard(String cardTitle) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
          onTap: () {
            selectCard(cardTitle);
          },
          child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              width: MediaQuery.of(context).size.width * 0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: cardTitle == selectedCard
                    ? Colors.white
                    : Color(0xff003844),
              ),
              child: Center(
                child: Text(cardTitle,
                    style: TextStyle(
                      color: cardTitle == selectedCard
                          ? Color(0xff003844)
                          : Colors.white,
                    )),
              ))),
    );
  }
}
