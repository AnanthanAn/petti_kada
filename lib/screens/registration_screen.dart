import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/helpers/firebase_helper.dart';
import 'package:petti_kada/screens/home_page.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = '/regisration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email;
  String _phone;
  String _password;
  String _confirmPassword;
  String _name;
  String _address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: kTextFieldLabelStyle,
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          _name = value;
                        },
                      ),
                      TextField(
                        onChanged: (value) {
                          _email = value;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: kTextFieldLabelStyle,
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        onChanged: (value) {
                          _phone = value;
                        },
                        decoration: InputDecoration(
                            labelText: 'PHONE',
                            labelStyle: kTextFieldLabelStyle,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: kTextFieldLabelStyle,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'CONFIRM PASSWORD ',
                            labelStyle: kTextFieldLabelStyle,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'ADDRESS',
                          labelStyle: kTextFieldLabelStyle,
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          _address = value;
                        },
                      ),
                      SizedBox(height: 50.0),
                      GestureDetector(
                        onTap: () async{
                         await FirebaseHelper.signUpNewUser(
                              _email, _password, _name, _phone, _address);
                         Navigator.pushReplacementNamed(context, HomePage.routeName);
                        },
                        child: Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.green,
                              elevation: 7.0,
                              child: Center(
                                child: Text('SIGNUP', style: kButtonTextStyle),
                              ),
                            )),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]));
  }
}
