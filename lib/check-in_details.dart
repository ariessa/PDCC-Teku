import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart';
import 'package:pdcc_teku/check-in_main.dart';

class CheckInDetails extends StatelessWidget {
  CheckInDetails(
      {@required this.checkInId,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.checkInDate,
      this.checkInTime});

  final checkInId;
  final firstName;
  final lastName;
  final email;
  final phoneNumber;
  final checkInDate;
  final checkInTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child:     Material(
      color: Color(0xfff1f9ff),
      child: SingleChildScrollView(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                            padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 15,
            bottom: SizeConfig.blockSizeVertical * 20),
                  child: Card(
                    margin: EdgeInsets.only(
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
                                      left: SizeConfig.blockSizeHorizontal * 2.5, 
                                      bottom: SizeConfig.blockSizeVertical * 1, 
                                      top: SizeConfig.blockSizeVertical * 2.5),
                                  child: Text("CHECK IN FOR",
                                      textScaleFactor: 0.8,
                                      style: TextStyle(
                                        color: Color(0xffbce0fd),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 2.5, 
                                      bottom: SizeConfig.blockSizeVertical * 0.5, 
                                    ),
                                    child: Text(firstName,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          color: Color(0xff2699fb),
                                          fontWeight: FontWeight.bold,
                                        ))),
                                Container(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 2.5, 
                                      bottom: SizeConfig.blockSizeVertical * 3, 
                                    ),
                                    child: Text(lastName,
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
                                      left: SizeConfig.blockSizeHorizontal * 2.5,
                                      right: SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom: SizeConfig.blockSizeVertical * 3, 
                                    ),
                                    child: Text(email,
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
                                      left: SizeConfig.blockSizeHorizontal * 2.5,
                                      right: SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom: SizeConfig.blockSizeVertical * 3, 
                                    ),
                                    child: Text(phoneNumber,
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
                                      left: SizeConfig.blockSizeHorizontal * 2.5,
                                      right: SizeConfig.blockSizeHorizontal * 2.5,
                                      bottom: SizeConfig.blockSizeVertical * 3, 
                                    ),
                                    child: Text(checkInDate.toString(),
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
                                      left: SizeConfig.blockSizeHorizontal * 2.5,
                                      right: SizeConfig.blockSizeHorizontal * 2.5,
                                    ),
                                    child: Text(checkInTime.toString(),
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          color: Color(0xff2699fb),
                                          fontWeight: FontWeight.bold,
                                        ))),
                              ],
                            )),
                        Container(
                          margin:
                              EdgeInsets.only(
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
                              'CLOSE',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckInMain())),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
