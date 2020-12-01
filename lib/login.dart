import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart' show EmailValidator, SizeConfig;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            body: SingleChildScrollView(
          child: Container(
              child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.blockSizeVertical * 50,
                          child: Container(
                              color: Color(0xfff1f9ff),
                              constraints: BoxConstraints.expand(),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                      height:
                                          SizeConfig.blockSizeVertical * 12),
                                  Image.asset('assets/Logo.png'),
                                  SizedBox(
                                      height: SizeConfig.blockSizeVertical * 5),
                                  Text('PDCC Teku',
                                      textScaleFactor:
                                          SizeConfig.safeBlockVertical * 0.3,
                                      style: TextStyle(
                                        color: Color(0xff2699fb),
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              )),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeHorizontal * 10,
                          left: SizeConfig.blockSizeHorizontal * 10,
                          right: SizeConfig.blockSizeHorizontal * 10),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email address cannot be empty';
                            }
                            if (!value.isValidEmail()) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          )),
                    ),
                    SizedBox(height: SizeConfig.blockSizeHorizontal * 5),
                    Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeHorizontal * 3,
                          bottom: SizeConfig.blockSizeHorizontal * 3,
                          left: SizeConfig.blockSizeHorizontal * 10,
                          right: SizeConfig.blockSizeHorizontal * 10),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          )),
                    ),
                    SizedBox(height: SizeConfig.blockSizeHorizontal * 5),
                    GestureDetector(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 2.5,
                              bottom: SizeConfig.blockSizeVertical * 2.5),
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 10,
                              right: SizeConfig.blockSizeHorizontal * 10,
                              bottom: SizeConfig.blockSizeHorizontal * 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: const Color(0xff2699fb)),
                          child: Text(
                            "LOGIN",
                            textAlign: TextAlign.center,
                            textScaleFactor:
                                SizeConfig.safeBlockVertical * 0.16,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onTap: () async {
                          // save the fields..
                          final form = _formKey.currentState;
                          form.save();

                          // Validate will return true if is valid, or false if invalid.
                          if (form.validate()) {
                            try {
                              await auth.FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _email, password: _password);
                            } on auth.FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                                _showMyDialog(
                                    context, 'No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                                _showMyDialog(context,
                                    'Wrong password provided for that user.');
                              }
                            }
                          }
                        }),
                  ]))),
        )));
  }

  Future<void> _showMyDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              title: Text('Invalid Login'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[Text(message)],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('CLOSE'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      },
    );
  }
}
