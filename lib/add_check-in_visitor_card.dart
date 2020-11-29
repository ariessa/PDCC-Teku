import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart';
import 'add_check-in_visitor_details.dart';

class AddCheckInVisitorCard extends StatelessWidget {
  AddCheckInVisitorCard(
      {@required this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.phoneNumber});

  final firstName;
  final lastName;
  final gender;
  final email;
  final phoneNumber;

  Widget build(BuildContext context) {
    String image = '';
    if (gender == 'Male') {
      image = 'assets/Boy.png';
    } else {
      image = 'assets/Girl.png';
    }
    return Card(
        child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddCheckInVisitorDetails(
                        firstName: firstName,
                        lastName: lastName,
                        gender: gender,
                        email: email,
                        phoneNumber: phoneNumber))),
            child: Container(
                // padding: EdgeInsets.only(top: 5.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 0.2, 
                          bottom: SizeConfig.blockSizeVertical * 0.2, 
                          left: SizeConfig.blockSizeHorizontal * 5, 
                          right: SizeConfig.blockSizeHorizontal * 5),
                      child: Image(
                        width: SizeConfig.blockSizeHorizontal * 18,
                        height: SizeConfig.blockSizeVertical * 18,
                        image: AssetImage(image),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 30,
                            padding: EdgeInsets.only(
                                top: 2, bottom: 5, left: 10, right: 10),
                            child: Text(
                              firstName.toString().toUpperCase(),
                              textAlign: TextAlign.start,
                              textScaleFactor: 1,
                              style: TextStyle(
                                color: Color(0xff2699fb),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 30,
                            padding: EdgeInsets.only(
                                top: 8, bottom: 5, left: 10, right: 10),
                            child: Text(
                              lastName.toString().toUpperCase(),
                              textAlign: TextAlign.start,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  color: Color(0xff2699fb),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 20,
                          padding: EdgeInsets.all(10),
                          child: Text("NAME",
                              textAlign: TextAlign.end,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  color: Color(0xffbce0fd),
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 20,
                          padding: EdgeInsets.all(10),
                          child: Text("    ",
                              textScaleFactor: 1, textAlign: TextAlign.end),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
