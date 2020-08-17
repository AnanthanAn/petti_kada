import 'package:bot_toast/bot_toast.dart';
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
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _passController;
  TextEditingController _confirmPassController;

  @override
  void initState() {
    _passController = TextEditingController();
    _confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
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
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: kTextFieldLabelStyle,
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty || value.length < 3)
                            return 'Enter a valid username';
                          return null;
                        },
                        onSaved: (value) {
                          _name = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: kTextFieldLabelStyle,
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@'))
                            return 'Enter a valid email';
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PHONE',
                            labelStyle: kTextFieldLabelStyle,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty ||
                              value.length < 10 ||
                              value.length > 10) return 'Enter a valid phone';
                          return null;
                        },
                        onSaved: (value) {
                          _phone = value;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(controller: _passController,
                        decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: kTextFieldLabelStyle,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty || value.length < 6)
                            return 'Enter a valid password';
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(controller: _confirmPassController,
                        decoration: InputDecoration(
                            labelText: 'CONFIRM PASSWORD ',
                            labelStyle: kTextFieldLabelStyle,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty || value.length < 6 || _passController.value.text.isEmpty || value != _passController.value.text)
                            return 'Enter a valid username';
                          return null;
                        },
                        onSaved: (value) {
                          _confirmPassword = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'ADDRESS',
                          labelStyle: kTextFieldLabelStyle,
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty || value.length < 6)
                            return 'Enter a valid Address';
                          return null;
                        },
                        onSaved: (value) {
                          _address = value;
                        },
                      ),
                      SizedBox(height: 50.0),
                      GestureDetector(
                        onTap: () async {
                          if(!_formkey.currentState.validate()){
                            return;
                          }
                          _formkey.currentState.save();
                          BotToast.showLoading();
                          try{
                            await FirebaseHelper.signUpNewUser(
                                _email, _password, _name, _phone, _address);
                            Navigator.pushReplacementNamed(
                                context, HomePage.routeName);
                          }catch(e){
                            _showErrorDialog(context, e.toString());
                          }

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
                                      fontWeight: FontWeight.bold,)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ]));
  }
  void _showErrorDialog(BuildContext context, String errorText) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Oops...'),
        content: Text(errorText),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('OK'))
        ],
      ),
    );
  }
}
