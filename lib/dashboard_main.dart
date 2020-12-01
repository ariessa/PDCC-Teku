import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdcc_teku/dashboard_daily-check-ins_card.dart';
import 'package:pdcc_teku/dashboard_weekly-check-ins_card.dart';
import 'package:pdcc_teku/menu.dart';
import 'package:pdcc_teku/misc.dart';

class DashboardMain extends StatefulWidget {
  @override
  _DashboardMainState createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
  List<charts.Series<Task, String>> _seriesPieData;
  List<Task> mydata;

  _generateData(mydata) {
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.taskDetails,
        measureFn: (Task task, _) => task.taskVal,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(task.colorVal))),
        id: 'task',
        data: mydata,
        labelAccessorFn: (Task row, _) => "${row.taskVal}",
      ),
    );
  }

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            leading: GestureDetector(
              child: Image.asset('assets/Menu.png'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage())),
            ),
            title: Text(
              'DASHBOARD',
              style: TextStyle(color: Color(0xff2699fb)),
              textScaleFactor: SizeConfig.safeBlockVertical * 0.1,
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
              child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 5,
                      right: SizeConfig.blockSizeHorizontal * 5,
                      top: SizeConfig.blockSizeVertical * 2.5,
                      bottom: SizeConfig.blockSizeVertical * 1),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('dashboard')
                          .doc('totalVisitors')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return new LoadingCircle();
                        }

                        return new DashboardDailyVisitorsCard(
                          totalDailyVisitors:
                              snapshot.data['totalDailyVisitors'],
                        );
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeVertical * 1,
                      left: SizeConfig.blockSizeHorizontal * 5,
                      right: SizeConfig.blockSizeHorizontal * 5),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('dashboard')
                          .doc('totalVisitors')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return new LoadingCircle();
                        }
                        return new DashboardWeeklyVisitorsCard(
                          totalWeeklyVisitors:
                              snapshot.data['totalWeeklyVisitors'],
                        );
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: SizeConfig.blockSizeVertical * 5,
                    left: SizeConfig.blockSizeHorizontal * 5,
                    right: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('genders')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return LinearProgressIndicator();
                      } else {
                        List<Task> task = snapshot.data.docs
                            .map((documentSnapshot) =>
                                Task.fromMap(documentSnapshot.data()))
                            .toList();
                        return _buildChart(context, task);
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
        ));
  }

  Widget _buildChart(BuildContext context, List<Task> taskdata) {
    mydata = taskdata;
    _generateData(mydata);
    return Container(
      height: SizeConfig.blockSizeVertical * 50,
      width: double.infinity,
      child: Card(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.5),
                child: Text(
                  'VISITORS BY GENDER',
                  textScaleFactor: SizeConfig.safeBlockVertical * 0.15,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2.5,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 5),
                    behaviors: [
                      new charts.DatumLegend(
                          outsideJustification:
                              charts.OutsideJustification.startDrawArea,
                          position: charts.BehaviorPosition.bottom,
                          horizontalFirst: false,
                          desiredMaxRows: 1,
                          cellPadding: new EdgeInsets.only(
                              right: SizeConfig.blockSizeHorizontal * 5,
                              left: SizeConfig.blockSizeHorizontal * 5,
                              bottom: SizeConfig.blockSizeVertical * 2.5,
                              top: SizeConfig.blockSizeVertical * 2.5),
                          entryTextStyle: charts.TextStyleSpec(
                            color: charts.ColorUtil.fromDartColor(Colors.black),
                            fontFamily: 'Arial',
                            fontSize:
                                (SizeConfig.safeBlockHorizontal * 3.5).toInt(),
                          ))
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth:
                            (SizeConfig.blockSizeHorizontal * 100).toInt(),
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  final int taskVal;
  final String taskDetails;
  final String colorVal;

  Task(this.taskDetails, this.taskVal, this.colorVal);

  Task.fromMap(Map<String, dynamic> map)
      : assert(map['taskDetails'] != null),
        assert(map['taskVal'] != null),
        assert(map['colorVal'] != null),
        taskDetails = map['taskDetails'].toString().toUpperCase(),
        taskVal = map['taskVal'],
        colorVal = map['colorVal'];

  @override
  String toString() => "Record<$taskVal:$taskDetails>";
}
