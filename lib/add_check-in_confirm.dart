import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pdcc_teku/add_check-in_completed.dart';
import 'package:pdcc_teku/misc.dart';
import 'package:week_of_year/week_of_year.dart';

class AddCheckInConfirm extends StatefulWidget {
  AddCheckInConfirm(
      {@required this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.checkInDate,
      this.checkInTime});

  final firstName;
  final lastName;
  final email;
  final phoneNumber;
  final checkInDate;
  final checkInTime;

  @override
  _AddCheckInConfirmState createState() => _AddCheckInConfirmState(
      firstName, lastName, email, phoneNumber, checkInDate, checkInTime);
}

class _AddCheckInConfirmState extends State<AddCheckInConfirm> {
  String _firstName;
  String _lastName;
  String _email;
  String _phoneNumber;
  String _checkInDate;
  String _checkInTime;

  final db = FirebaseFirestore.instance;
  var firestoreDate;
  var firestoreWeek;

  _AddCheckInConfirmState(this._firstName, this._lastName, this._email,
      this._phoneNumber, this._checkInDate, this._checkInTime);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                'CONFIRM CHECK IN',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Timeline
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2.5,
                        left: SizeConfig.blockSizeHorizontal * 2.5,
                        right: SizeConfig.blockSizeHorizontal * 2.5),
                    child: ScreenProgress(ticks: 3),
                  ),

                  Card(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 7.5,
                        bottom: SizeConfig.blockSizeVertical * 7.5,
                        left: SizeConfig.blockSizeHorizontal * 7.5,
                        right: SizeConfig.blockSizeHorizontal * 7.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                                right: SizeConfig.blockSizeHorizontal * 5,
                                left: SizeConfig.blockSizeHorizontal * 5,
                                top: SizeConfig.blockSizeHorizontal * 2.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom: SizeConfig.blockSizeVertical * 1,
                                      top: SizeConfig.blockSizeVertical * 2.5),
                                  child: Text("CHECK-IN FOR",
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                        color: Color(0xffbce0fd),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom:
                                          SizeConfig.blockSizeVertical * 0.5,
                                    ),
                                    child: Text(_firstName,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          color: Color(0xff2699fb),
                                          fontWeight: FontWeight.bold,
                                        ))),
                                Container(
                                    padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom: SizeConfig.blockSizeVertical * 3,
                                    ),
                                    child: Text(_lastName,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          color: Color(0xff2699fb),
                                          fontWeight: FontWeight.bold,
                                        ))),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2.5,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: Text("EMAIL",
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                        color: Color(0xffbce0fd),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom: SizeConfig.blockSizeVertical * 3,
                                    ),
                                    child: Text(_email,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          color: Color(0xff2699fb),
                                          fontWeight: FontWeight.bold,
                                        ))),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2.5,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: Text("PHONE NUMBER",
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                        color: Color(0xffbce0fd),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom: SizeConfig.blockSizeVertical * 3,
                                    ),
                                    child: Text(_phoneNumber,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          color: Color(0xff2699fb),
                                          fontWeight: FontWeight.bold,
                                        ))),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2.5,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: Text("DATE",
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                        color: Color(0xffbce0fd),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom: SizeConfig.blockSizeVertical * 3,
                                    ),
                                    child: Text(_checkInDate,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          color: Color(0xff2699fb),
                                          fontWeight: FontWeight.bold,
                                        ))),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2.5,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: Text("TIME",
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                        color: Color(0xffbce0fd),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 2.5,
                                    ),
                                    child: Text(_checkInTime,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          color: Color(0xff2699fb),
                                          fontWeight: FontWeight.bold,
                                        ))),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 5,
                            left: SizeConfig.blockSizeHorizontal * 7.5,
                            right: SizeConfig.blockSizeHorizontal * 7.5,
                            bottom: SizeConfig.blockSizeVertical * 5,
                          ),
                          width: double.infinity,
                          height: SizeConfig.blockSizeVertical * 6,
                          child: RaisedButton(
                            color: Color(0xff2699fb),
                            child: Text(
                              'CONFIRM',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              // Combine firstName and lastName with space in between
                              String combinedName =
                                  _firstName + " " + _lastName;

                              List<String> splitList = combinedName.split(" ");
                              List<String> indexList = [];

                              for (int i = 0; i < splitList.length; i++) {
                                for (int y = 1;
                                    y < splitList[i].length + 1;
                                    y++) {
                                  indexList.add(splitList[i]
                                      .substring(0, y)
                                      .toLowerCase());
                                }
                              }

                              // Add new document with autoID under collection check-ins
                              // Add document fields such as firstName, lastName, email, phoneNumber,
                              // checkInDate, checkInTime, searchIndex
                              await db.collection('check-ins').doc().set({
                                'firstName': _firstName,
                                'lastName': _lastName,
                                'email': _email,
                                'phoneNumber': _phoneNumber,
                                'checkInDate': _checkInDate,
                                'checkInTime': _checkInTime,
                                'searchIndex': indexList,
                              });

                              // Get document with ID totalVisitors in collection dashboard
                              await FirebaseFirestore.instance
                                  .collection('dashboard')
                                  .doc('totalVisitors')
                                  .get()
                                  .then((DocumentSnapshot documentSnapshot) {
                                // Get value of field date from document dashboard/totalVisitors
                                firestoreDate = documentSnapshot.data()['date'];

                                // Get value of field weekOfYear from document dashboard/totalVisitors
                                firestoreWeek =
                                    documentSnapshot.data()['weekOfYear'];
                              });

                              // Get current date in the format of Year-Month-Day
                              var todayDate = new intl.DateFormat('yMd')
                                  .format(DateTime.now());

                              // Get number of week in year
                              var todayWeek = DateTime.now().weekOfYear;

                              developer.log("todayDate: $todayDate");
                              developer.log("todayWeek: $todayWeek");
                              developer.log("firestoreDate: $firestoreDate");
                              developer
                                  .log("firestoreWeekNumber: $firestoreWeek");

                              // Check if todayDate == firestoreDate or not
                              // If true, increment totalDailyVisitors by 1
                              if (todayDate == firestoreDate) {
                                // Increment value of field totalDailyVisitors by 1
                                db
                                    .collection('dashboard')
                                    .doc('totalVisitors')
                                    .update({
                                  "totalDailyVisitors": FieldValue.increment(1)
                                });
                              }

                              // Else if todayDate != firestoreDate
                              else {
                                // Update value of date to todayDate
                                // Update value of totalDailyVisitors to 1
                                db
                                    .collection('dashboard')
                                    .doc('totalVisitors')
                                    .update({
                                  "date": todayDate,
                                  "totalDailyVisitors": 1
                                });
                              }

                              // Check if todayWeek == firestoreWeek or not
                              // If true, increment totalWeeklyVisitors by 1
                              if (todayWeek == firestoreWeek) {
                                // Increment totalWeeklyVisitors by 1
                                db
                                    .collection('dashboard')
                                    .doc('totalVisitors')
                                    .update({
                                  "totalWeeklyVisitors": FieldValue.increment(1)
                                });
                              }

                              // Else if todayWeek != firestoreWeek
                              else {
                                // Update value of week to todayWeek
                                // Update value of totalWeeklyVisitors to 1
                                db
                                    .collection('dashboard')
                                    .doc('totalVisitors')
                                    .update({
                                  "weekOfYear": todayWeek,
                                  "totalWeeklyVisitors": 1
                                });
                              }

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddCheckInCompleted()));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))));
  }
}
