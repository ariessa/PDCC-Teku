import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdcc_teku/check-in_main.dart';
import 'package:pdcc_teku/main.dart';
import 'package:pdcc_teku/visitor_main.dart';

import 'dashboard_main.dart';
import 'misc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Material(
            child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: const Color(0xffffffff)),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 12),
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.screenWidth,
              child: ListTile(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMain())),
                  leading: Image.asset('assets/Dashboard.png'),
                  title: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 10),
                    child: Text('Dashboard'.toUpperCase(),
                        textScaleFactor: SizeConfig.safeBlockVertical * 0.18,
                        style: TextStyle(
                            color: Color(0xff2699fb),
                            fontWeight: FontWeight.bold)),
                  )),
            ),
            Container(
              decoration: BoxDecoration(color: const Color(0xfff1f9ff)),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 12),
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.screenWidth,
              child: ListTile(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckInMain())),
                  leading: Image.asset('assets/CheckIn.png'),
                  title: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 10),
                    child: Text('Check In'.toUpperCase(),
                        textScaleFactor: SizeConfig.safeBlockVertical * 0.18,
                        style: TextStyle(
                            color: Color(0xff2699fb),
                            fontWeight: FontWeight.bold)),
                  )),
            ),
            Container(
              decoration: BoxDecoration(color: const Color(0xff7fc4fd)),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 12),
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.screenWidth,
              child: ListTile(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VisitorMain())),
                  leading: Image.asset('assets/Visitor.png'),
                  title: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 10),
                    child: Text('Visitor'.toUpperCase(),
                        textScaleFactor: SizeConfig.safeBlockVertical * 0.18,
                        style: TextStyle(
                            color: Color(0xff2699fb),
                            fontWeight: FontWeight.bold)),
                  )),
            ),
            Container(
              decoration: BoxDecoration(color: const Color(0xff2699fb)),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 12),
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.screenWidth,
              child: ListTile(
                  onTap: () async {
                    _asyncConfirmDialog(context);
                  },
                  leading: Image.asset('assets/LogOut.png'),
                  title: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 10),
                    child: Text('Log Out'.toUpperCase(),
                        textScaleFactor: SizeConfig.safeBlockVertical * 0.18,
                        style: TextStyle(
                            color: Color(0xffbce0fd),
                            fontWeight: FontWeight.bold)),
                  )),
            ),
          ],
        )));
  }
}

enum ConfirmAction { CANCEL, CONFIRM }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button to close dialog!
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            title: Text('Log Out'),
            content: const Text('Are you sure you want to log out?'),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop(ConfirmAction.CANCEL);
                },
              ),
              FlatButton(
                child: const Text('CONFIRM'),
                onPressed: () async {
                  await auth.FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop(ConfirmAction.CONFIRM);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              )
            ],
          ));
    },
  );
}
