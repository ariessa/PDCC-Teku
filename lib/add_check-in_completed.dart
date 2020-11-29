import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart';
import 'package:pdcc_teku/check-in_main.dart';

class AddCheckInCompleted extends StatefulWidget {
  @override
  _AddCheckInCompletedState createState() => _AddCheckInCompletedState();
}

class _AddCheckInCompletedState extends State<AddCheckInCompleted> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            'CHECK-IN COMPLETED',
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
                  right: SizeConfig.blockSizeHorizontal * 2.5,
                  bottom: SizeConfig.blockSizeVertical * 7.5),
                child: ScreenProgress(ticks: 4),
              ),

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
                        "New check in has been added",
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
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckInMain())),
                ),
              ),
                  ],
                ),
              ),

            ],
          ),
        )));
  }
}
