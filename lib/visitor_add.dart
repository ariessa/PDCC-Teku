import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdcc_teku/visitor_added.dart';
import 'package:pdcc_teku/misc.dart' show EmailValidator, SizeConfig;

class VisitorAdd extends StatefulWidget {
  @override
  _VisitorAddState createState() => _VisitorAddState();
}

class _VisitorAddState extends State<VisitorAdd> {
  final _formKey = GlobalKey<FormState>();
  final db = FirebaseFirestore.instance;
  String _firstName;
  String _lastName;
  String _gender;
  String _email;
  String _phoneNumber;
  int radioValue = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Back.png'),
            onTap: () => Navigator.pop(context),
          ),
          title: Text(
            'ADD VISITOR',
            style: TextStyle(color: Color(0xff2699fb)),
            textScaleFactor: 0.8,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          // padding: EdgeInsets.all(10.0),
          child: Container(
              color: Colors.white,
              // padding: EdgeInsets.all(10.0),
              child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    // SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5, 
                      bottom: SizeConfig.blockSizeVertical * 2.5, 
                      left: SizeConfig.blockSizeHorizontal * 7.5, 
                      right: SizeConfig.blockSizeHorizontal * 7.5),
                      child: TextFormField(
                          onSaved: (value) => _firstName = value,
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          validator: (value) =>
                              value.isEmpty ? 'First Name is required' : null,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          decoration: InputDecoration(
                            labelText: "First Name",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              // borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          )),
                    ),
                    // SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1,
                      bottom: SizeConfig.blockSizeVertical * 2.5, 
                      left: SizeConfig.blockSizeHorizontal * 7.5, 
                      right: SizeConfig.blockSizeHorizontal * 7.5),
                      child: TextFormField(
                          onSaved: (value) => _lastName = value,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          validator: (value) =>
                              value.isEmpty ? 'Last Name is required' : null,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          decoration: InputDecoration(
                            labelText: "Last Name",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              // borderRadius: new BorderRadius.circular(25.0),
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
                          onSaved: (value) => _email = value,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                     validator: (value) {
                      if (value.isEmpty) {
                        return 'Email address cannot be empty';
                      }
                      if (!value.isValidEmail()) {
                        return 'Invalid email';
                      }
                      return null;
                    },
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
                          onSaved: (value) => _phoneNumber = value,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          validator: (value) =>
                              value.isEmpty ? 'Phone Number is required' : null,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                          ],
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              // borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          )),
                    ),

                    Container(
                      padding: EdgeInsets.all(20),
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
                        margin:
                            EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 7.5, 
                      right: SizeConfig.blockSizeHorizontal * 7.5, 
                      bottom: SizeConfig.blockSizeHorizontal * 5),
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: const Color(0xff2699fb)),
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

                          String combinedName = _firstName + " " + _lastName;

                          List<String> splitList = combinedName.split(" ");
                          List<String> indexList = [];

                          for (int i = 0; i < splitList.length; i++) {
                            for (int y = 1; y < splitList[i].length + 1; y++) {
                              indexList.add(
                                  splitList[i].substring(0, y).toLowerCase());
                            }
                          }

                          await db.collection('visitors').doc().set({
                            'firstName': _firstName,
                            'lastName': _lastName,
                            'gender': _gender,
                            'email': _email,
                            'phoneNumber': _phoneNumber,
                            'searchIndex': indexList,
                          });

                          if (_gender == "Male") {
                            db
                                .collection('genders')
                                .doc('male')
                                .update({"taskVal": FieldValue.increment(1)});
                          } else {
                            db
                                .collection('genders')
                                .doc('female')
                                .update({"taskVal": FieldValue.increment(1)});
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VisitorAdded()));
                        } else {
                          errorDialog(context);
                        }
                      },
                    ),
                  ]))),
        ));
  }
}

Future errorDialog(BuildContext context) {
  return showDialog(
    builder: (context) {
      return AlertDialog(
        title: Text('Invalid Form'),
        content: Text("All details are required to submit the form"),
        actions: <Widget>[
          FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      );
    },
    context: context,
  );
}
