import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart';
import 'package:pdcc_teku/add_check-in_details.dart';

class AddCheckInVisitorDetails extends StatelessWidget {
  AddCheckInVisitorDetails(
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
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'SELECT VISITOR',
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
            child: Card(
              margin: EdgeInsets.only(
                top: 40, 
                bottom: 40, 
                left: 30, 
                right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 5, 
                        bottom: SizeConfig.blockSizeVertical * 2.5, 
                        left: SizeConfig.blockSizeHorizontal * 5, 
                        right: SizeConfig.blockSizeHorizontal * 5),
                        child: Image(
                          width: SizeConfig.blockSizeHorizontal * 28,
                          fit: BoxFit.cover,
                          image: AssetImage(image),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                                                  top: SizeConfig.blockSizeVertical * 5, 
                      bottom: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 3
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "VISITOR NAME",
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
                  top: SizeConfig.blockSizeVertical * 2
                      ),
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
                  Container(
                    margin: EdgeInsets.only(                        
                      top: SizeConfig.blockSizeVertical * 5, 
                        bottom: SizeConfig.blockSizeVertical * 5, 
                        right: SizeConfig.blockSizeHorizontal * 7.5, 
                        left: SizeConfig.blockSizeHorizontal * 7.5),
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical * 6,
                    // color: Color(0xff2699fb),
                    child: RaisedButton(
                      color: Color(0xff2699fb),
                      child: Text(
                        'SELECT',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCheckInDetails(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                    phoneNumber: phoneNumber,
                                  ))),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
