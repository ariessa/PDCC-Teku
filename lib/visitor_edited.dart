import 'package:flutter/material.dart';
import 'package:pdcc_teku/visitor_main.dart';
import 'package:pdcc_teku/misc.dart';

class VisitorEdited extends StatefulWidget {
  @override
  _VisitorEditedState createState() => _VisitorEditedState();
}

class _VisitorEditedState extends State<VisitorEdited> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child:     Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 15,
            bottom: SizeConfig.blockSizeVertical * 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // SizedBox(height: SizeConfig.blockSizeVertical * 10),
              Card(
                margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 10),
                      width: double.infinity,
                      child: Image(
                          image: AssetImage('assets/Checkbox.png'),
                          alignment: Alignment.center,
                          height: SizeConfig.blockSizeVertical * 20,
                          width: SizeConfig.blockSizeVertical * 20),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 5, 
                          right: SizeConfig.blockSizeHorizontal * 5, 
                          // top: SizeConfig.blockSizeVertical * 5, 
                          bottom: SizeConfig.blockSizeVertical * 5),
                      child: Text(
                        "Edited visitor",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: Color(0xff2699fb),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 5, 
                          left: SizeConfig.blockSizeHorizontal * 5, 
                          right: SizeConfig.blockSizeHorizontal * 5, 
                          bottom: SizeConfig.blockSizeVertical * 5),
                      width: double.infinity,
                      height: SizeConfig.blockSizeVertical * 6,
                      // color: Color(0xff2699fb),
                      child: RaisedButton(
                        color: Color(0xff2699fb),
                        child: Text(
                          'CLOSE',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VisitorMain())),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))));
  }
}
