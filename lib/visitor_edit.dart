import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdcc_teku/misc.dart';
import 'package:pdcc_teku/visitor_edited.dart';

class VisitorEdit extends StatefulWidget {
  VisitorEdit(
      {@required this.documentId,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.phoneNumber});

  final documentId;
  final firstName;
  final lastName;
  final gender;
  final email;
  final phoneNumber;

  @override
  _VisitorEditState createState() => _VisitorEditState(
      documentId, firstName, lastName, gender, email, phoneNumber);
}

class _VisitorEditState extends State<VisitorEdit> {
  final _formKey = GlobalKey<FormState>();
  final db = FirebaseFirestore.instance;
  String _documentId;
  String _firstName;
  String _lastName;
  String _gender;
  String _email;
  String _phoneNumber;
  int radioValue;

  _VisitorEditState(this._documentId, this._firstName, this._lastName,
      this._gender, this._email, this._phoneNumber);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (_gender == "Male") {
      radioValue = 0;
    } else {
      radioValue = 1;
    }
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            leading: GestureDetector(
              child: Image.asset('assets/Back.png'),
              onTap: () => Navigator.pop(context),
            ),
            title: Text(
              'EDIT VISITOR',
              style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: 0.8,
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 5,
                        bottom: SizeConfig.blockSizeVertical * 2.5,
                        left: SizeConfig.blockSizeHorizontal * 7.5,
                        right: SizeConfig.blockSizeHorizontal * 7.5),
                    child: TextFormField(
                        initialValue: _firstName,
                        onSaved: (value) => _firstName = value,
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            value.isEmpty ? 'First Name is required' : null,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.deny(RegExp("[0-9]")),
                        ],
                        decoration: InputDecoration(
                          labelText: "First Name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(),
                          ),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1,
                        bottom: SizeConfig.blockSizeVertical * 2.5,
                        left: SizeConfig.blockSizeHorizontal * 7.5,
                        right: SizeConfig.blockSizeHorizontal * 7.5),
                    child: TextFormField(
                        initialValue: _lastName,
                        onSaved: (value) => _lastName = value,
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            value.isEmpty ? 'Last Name is required' : null,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.deny(RegExp("[0-9]")),
                        ],
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(),
                          ),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1,
                        bottom: SizeConfig.blockSizeVertical * 2.5,
                        left: SizeConfig.blockSizeHorizontal * 7.5,
                        right: SizeConfig.blockSizeHorizontal * 7.5),
                    child: TextFormField(
                        initialValue: _email,
                        onSaved: (value) => _email = value,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email address is required';
                          }
                          if (!value.isValidEmail()) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(14),
                        ],
                        decoration: InputDecoration(
                          labelText: "Email",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(),
                          ),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 1,
                        bottom: SizeConfig.blockSizeVertical * 2.5,
                        left: SizeConfig.blockSizeHorizontal * 7.5,
                        right: SizeConfig.blockSizeHorizontal * 7.5),
                    child: TextFormField(
                        initialValue: _phoneNumber,
                        onSaved: (value) => _phoneNumber = value,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Phone Number is required';
                          }
                          if (!value.isValidPhoneNumber()) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                        ],
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(),
                          ),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1,
                              bottom: SizeConfig.blockSizeVertical * 2.5,
                              left: SizeConfig.blockSizeHorizontal * 2.5,
                              right: SizeConfig.blockSizeHorizontal * 7.5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            new RadioListTile<int>(
                              title: new Text('Male'),
                              value: 0,
                              groupValue: radioValue,
                              onChanged: (ind) => setState(
                                () => radioValue = ind,
                              ),
                            ),
                            new RadioListTile<int>(
                              title: new Text('Female'),
                              value: 1,
                              groupValue: radioValue,
                              onChanged: (ind) => setState(
                                () => radioValue = ind,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 2),
                  GestureDetector(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeHorizontal * 5,
                            bottom: SizeConfig.blockSizeHorizontal * 5),
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 7.5,
                            right: SizeConfig.blockSizeHorizontal * 7.5,
                            bottom: SizeConfig.blockSizeHorizontal * 5),
                        decoration:
                            BoxDecoration(color: const Color(0xff2699fb)),
                        child: Text(
                          "SUBMIT",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onTap: () async {
                        if (radioValue == 0) {
                          _gender = "Male";
                        } else {
                          _gender = "Female";
                        }
                        // save the fields..
                        final form = _formKey.currentState;

                        // Validate will return true if is valid, or false if invalid.
                        if (form.validate()) {
                          form.save();
                          await db
                              .collection('visitors')
                              .doc(_documentId)
                              .update({
                            'firstName': _firstName,
                            'lastName': _lastName,
                            'gender': _gender,
                            'email': _email,
                            'phoneNumber': _phoneNumber
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VisitorEdited()));

                          if (_gender == "Male") {
                            FirebaseFirestore.instance
                                .collection('genders')
                                .doc('female')
                                .get()
                                .then((DocumentSnapshot documentSnapshot) {
                              if (documentSnapshot.exists) {
                                print('Document exists on the database');
                              }
                              if (documentSnapshot.data()['taskVal'] > 0) {
                                db.collection('genders').doc('female').update(
                                    {"taskVal": FieldValue.increment(-1)});
                              }
                            });
                            db
                                .collection('genders')
                                .doc('male')
                                .update({"taskVal": FieldValue.increment(-1)});
                            db
                                .collection('genders')
                                .doc('male')
                                .update({"taskVal": FieldValue.increment(1)});
                          } else {
                            FirebaseFirestore.instance
                                .collection('genders')
                                .doc('male')
                                .get()
                                .then((DocumentSnapshot documentSnapshot) {
                              if (documentSnapshot.exists) {
                                print('Document exists on the database');
                              }
                              if (documentSnapshot.data()['taskVal'] > 0) {
                                db.collection('genders').doc('male').update(
                                    {"taskVal": FieldValue.increment(-1)});
                              }
                            });
                            db
                                .collection('genders')
                                .doc('female')
                                .update({"taskVal": FieldValue.increment(-1)});
                            db
                                .collection('genders')
                                .doc('female')
                                .update({"taskVal": FieldValue.increment(1)});
                          }
                        } else {
                          errorDialog(context);
                        }
                      })
                ]),
              ),
            ),
          ),
        ));
  }
}

Future errorDialog(BuildContext context) {
  return showDialog(
    builder: (context) {
      return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            title: Text('Invalid Form'),
            content: Text("All details are required to submit the form"),
            actions: <Widget>[
              FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ));
    },
    context: context,
  );
}
