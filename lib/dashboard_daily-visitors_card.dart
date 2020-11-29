import 'package:flutter/material.dart';
import 'package:pdcc_teku/misc.dart';

class DashboardDailyVisitorsCard extends StatelessWidget {
  DashboardDailyVisitorsCard({this.totalDailyVisitors});

  final totalDailyVisitors;

  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
            color: Color(0xff7fc4fd),
            child: Container(
                margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2.5),
                child: Column(
                  children: <Widget>[
                    Text("DAILY VISITORS",
                        textScaleFactor: SizeConfig.safeBlockVertical * 0.13,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2.5,
                    ),
                    Text(totalDailyVisitors.toString(),
                        textScaleFactor: SizeConfig.safeBlockVertical * 0.4,
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                ))));
  }
}
