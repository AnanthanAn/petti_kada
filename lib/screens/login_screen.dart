import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petti_kada/constants/constants.dart';
import 'package:petti_kada/helpers/firebase_helper.dart';
import 'package:petti_kada/screens/home_page.dart';
import 'package:petti_kada/screens/registration_screen.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  var _isLoading = false;
  //Todo : implement user auth without navigating to login every time

//  Future<FirebaseUser> getUser()async{
//    FirebaseUser user = await _auth.currentUser();
//    return user;
//
//  }

  @override
  void initState() {
    super.initState();

//    getUser() != null ? HomePage() : LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                          child: Text('Shop',
                              style: TextStyle(
                                  fontSize: 80.0, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                          child: Text('Lift',
                              style: TextStyle(
                                  fontSize: 80.0, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(135.0, 175.0, 0.0, 0.0),
                          child: Text('.',
                              style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: kTextFieldLabelStyle,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                            onChanged: (value) {
                              _email = value;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'PASSWORD',
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
                          SizedBox(height: 5.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
                            child: InkWell(
                              child: GestureDetector(
                                onTap: () {
                                  //TODo
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          GestureDetector(
                            onTap: () async {
                              await FirebaseHelper.signIn(_email, _password);
                            },
                            child: Container(
                              height: 40.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: kButtonTextStyle,
                                  ),
                                ),
                              ),
                            ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: 10.0),
                                  Center(
                                    child: Text('Log in with facebook',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New to ShopLift ?',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RegistrationScreen.routeName);
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ));
  }
}
