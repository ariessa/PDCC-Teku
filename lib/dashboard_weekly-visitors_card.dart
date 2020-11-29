import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart';

class DashboardWeeklyVisitorsCard extends StatelessWidget {
  DashboardWeeklyVisitorsCard({this.totalWeeklyVisitors});

  final totalWeeklyVisitors;

  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
            color: Color(0xfff1f9ff),
            child: Container(
                margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2.5),
                child: Column(
                  children: <Widget>[
                    Text("WEEKLY VISITORS",
                        textScaleFactor: SizeConfig.safeBlockVertical * 0.13,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2.5,
                    ),
                    Text(totalWeeklyVisitors.toString(),
                        textScaleFactor: SizeConfig.safeBlockVertical * 0.4,
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ],
                ))));
  }
}
