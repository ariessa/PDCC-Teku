import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart';
import 'package:pdcc_teku/check-in_details.dart';

class CheckInCard extends StatelessWidget {
  CheckInCard(
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

  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckInDetails(
                        checkInId: checkInId,
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        phoneNumber: phoneNumber,
                        checkInDate: checkInDate,
                        checkInTime: checkInTime))),
            child: Container(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1, 
                          bottom: SizeConfig.blockSizeVertical * 1, 
                          left: SizeConfig.blockSizeHorizontal * 2.5, 
                          right: SizeConfig.blockSizeHorizontal * 2.5),
                      child: Image(
                        width: SizeConfig.blockSizeHorizontal * 18,
                        height: SizeConfig.blockSizeVertical * 8,
                        image: AssetImage('assets/Money.png'),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 1,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 30,
                            padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1, 
                          bottom: SizeConfig.blockSizeVertical * 1, 
                          left: SizeConfig.blockSizeHorizontal * 2.5, 
                          right: SizeConfig.blockSizeHorizontal * 2.5),
                            child: Text(
                              firstName.toString().toUpperCase(),
                              textAlign: TextAlign.start,
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                color: Color(0xff2699fb),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 30,
                            padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1, 
                          bottom: SizeConfig.blockSizeVertical * 1, 
                          left: SizeConfig.blockSizeHorizontal * 2.5, 
                          right: SizeConfig.blockSizeHorizontal * 2.5),
                            child: Text(
                              lastName.toString().toUpperCase(),
                              textAlign: TextAlign.start,
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                  color: Color(0xff2699fb),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 30,
                            padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1, 
                          bottom: SizeConfig.blockSizeVertical * 1, 
                          left: SizeConfig.blockSizeHorizontal * 2.5, 
                          right: SizeConfig.blockSizeHorizontal * 2.5),
                            child: Text(
                              checkInDate.toString().toUpperCase(),
                              textAlign: TextAlign.start,
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                color: Color(0xff2699fb),
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 30,
                          padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1, 
                          bottom: SizeConfig.blockSizeVertical * 1, 
                          left: SizeConfig.blockSizeHorizontal * 2.5, 
                          right: SizeConfig.blockSizeHorizontal * 2.5),
                          child: Text("FIRST NAME",
                              textAlign: TextAlign.end,
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                  color: Color(0xffbce0fd),
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 30,
                          padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1, 
                          bottom: SizeConfig.blockSizeVertical * 1, 
                          left: SizeConfig.blockSizeHorizontal * 2.5, 
                          right: SizeConfig.blockSizeHorizontal * 2.5),
                          child: Text(
                            "LAST NAME",
                            textScaleFactor: 0.9,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Color(0xffbce0fd),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 20,
                          padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1, 
                          bottom: SizeConfig.blockSizeVertical * 1, 
                          left: SizeConfig.blockSizeHorizontal * 2.5, 
                          right: SizeConfig.blockSizeHorizontal * 2.5),
                          child: Text(
                            "DATE",
                            textScaleFactor: 0.9,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Color(0xffbce0fd),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
