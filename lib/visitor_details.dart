import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart';
import 'package:pdcc_teku/visitor_main.dart';
import 'package:pdcc_teku/visitor_edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VisitorDetails extends StatelessWidget {
  VisitorDetails({
    @required this.documentId,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phoneNumber,
  });

  final documentId;
  final firstName;
  final lastName;
  final gender;
  final email;
  final phoneNumber;

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String image = '';
    if (gender == 'Male') {
      image = 'assets/Boy.png';
    } else {
      image = 'assets/Girl.png';
    }
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset('assets/Back.png'),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => VisitorMain())),
        ),
        title: Text(
          'VISITOR',
          style: TextStyle(color: Color(0xff2699fb)),
          textScaleFactor: SizeConfig.safeBlockVertical * 0.1,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  padding:
                      EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 5, 
                        bottom: SizeConfig.blockSizeVertical * 2.5, 
                        left: SizeConfig.blockSizeHorizontal * 5, 
                        right: SizeConfig.blockSizeHorizontal * 5),
                  child: Image(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5, 
                      bottom: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "NAME",
                            textScaleFactor: 1,
                            style: TextStyle(
                              color: Color(0xffbce0fd),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                          child: Text(
                            firstName,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                          child: Text(
                            lastName,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Container(
                padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 5, 
                  top: SizeConfig.blockSizeVertical * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 2.5,
                      ),
                      child: Text("GENDER",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: Color(0xffbce0fd),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1,
                          left: SizeConfig.blockSizeHorizontal * 2.5,
                          bottom: SizeConfig.blockSizeVertical * 2.5,
                        ),
                        child: Text(gender,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            ))),
                    Container(
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 2.5,
                      ),
                      child: Text("EMAIL",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: Color(0xffbce0fd),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1,
                          left: SizeConfig.blockSizeHorizontal * 2.5,
                          bottom: SizeConfig.blockSizeVertical * 2.5,
                        ),
                        child: Text(email,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            ))),
                    Container(
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 2.5,
                      ),
                      child: Text("PHONE NUMBER",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: Color(0xffbce0fd),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1,
                          left: SizeConfig.blockSizeHorizontal * 2.5,
                          bottom: SizeConfig.blockSizeVertical * 2.5,
                        ),
                        child: Text(phoneNumber,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Color(0xff2699fb),
                              fontWeight: FontWeight.bold,
                            ))),
                  ],
                )),
            Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: (SizeConfig.screenWidth - 70) / 2,
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2, 
                        bottom: SizeConfig.blockSizeVertical * 2, 
                        right: SizeConfig.blockSizeHorizontal * 2, 
                        left: SizeConfig.blockSizeHorizontal * 7.5),
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff2699fb),
                        )),
                    child: Text(
                      "EDIT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff2699fb),
                      ),
                    ),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VisitorEdit(
                          documentId: documentId,
                          firstName: firstName,
                          lastName: lastName,
                          gender: gender,
                          email: email,
                          phoneNumber: phoneNumber,
                        ),
                      )),
                ),
                GestureDetector(
                  child: Container(
                    width: (SizeConfig.screenWidth - 70) / 2,
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2, 
                        bottom: SizeConfig.blockSizeVertical * 2, 
                        right: SizeConfig.blockSizeHorizontal * 7.5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Color(0xff2699fb)),
                    child: Text(
                      "DELETE",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () async {
                      _showMyDialog(context, 'Are you sure you want to delete visitor?');
                  },
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> _showMyDialog(BuildContext context, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Invalid Login'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message)
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('YES'),
            onPressed: () async {
                    await db.collection('visitors').doc(documentId).delete();

                    if (gender == "Male") {

                    FirebaseFirestore.instance
                    .collection('genders')
                    .doc('male')
                    .get()
                    .then((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.exists) {
                        print('Document exists on the database');
                      }
                      if (documentSnapshot.data()['taskVal'] > 0) {
                        db
                          .collection('genders')
                          .doc('male')
                          .update({"taskVal": FieldValue.increment(-1)});
                      }
                    });


                    } else {
                      
                                          FirebaseFirestore.instance
                    .collection('genders')
                    .doc('female')
                    .get()
                    .then((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.exists) {
                        print('Document exists on the database');
                      }
                      if (documentSnapshot.data()['taskVal'] > 0) {
                        db
                          .collection('genders')
                          .doc('female')
                          .update({"taskVal": FieldValue.increment(-1)});
                      }
                    });
                    }
              Navigator.of(context).pushReplacementNamed('/deleted');
            },
          ),
          TextButton(
            child: Text('NO'),
            onPressed: () async {
              Navigator.of(context).pop();
            }
          ),
        ],
      );
    },
  );
}
}
