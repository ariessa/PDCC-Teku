import 'package:flutter/material.dart';
import 'package:pdcc_teku/check-in_main.dart';
import 'package:pdcc_teku/misc.dart';
import 'package:pdcc_teku/add_check-in_visitor_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCheckInMain extends StatefulWidget {
  @override
  _AddCheckInMainState createState() => _AddCheckInMainState();
}

class _AddCheckInMainState extends State<AddCheckInMain> {
  String searchQuery = '';

  void initiateSearch(String val) {
    setState(() {
      searchQuery = val.toLowerCase().trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child:     Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Back.png'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CheckInMain())),
          ),
          title: Text(
            'ADD CHECK IN',
            style: TextStyle(color: Color(0xff2699fb)),
            textScaleFactor: 0.8,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              // Timeline
              Container(
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 2.5,
                  left: SizeConfig.blockSizeHorizontal * 2.5,
                  right: SizeConfig.blockSizeHorizontal * 2.5),
                alignment: Alignment.center,
                child: ScreenProgress(ticks: 1),
              ),

              // Search bar
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5, 
                    right: SizeConfig.blockSizeHorizontal * 5, 
                    top: SizeConfig.blockSizeVertical * 2.5, 
                    bottom: SizeConfig.blockSizeVertical * 1                 
                ),
                height: SizeConfig.blockSizeVertical * 10,
                width: SizeConfig.screenWidth,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6.0,
                            offset: Offset(2.0, 5.0))
                      ]),
                  child: TextField(
                    onChanged: (value) => initiateSearch(value),
                    style: TextStyle(color: Color(0xff2699fb)),
                    autofocus: true,
                    cursorColor: Color(0xff2699fb),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1, 
                          bottom: SizeConfig.blockSizeVertical * 1, 
                          left: SizeConfig.blockSizeHorizontal * 5, 
                          right: SizeConfig.blockSizeHorizontal * 5),
                        hintText: 'Search for visitor name...',
                        hintStyle:
                            TextStyle(color: Color(0xff2699fb), fontSize: SizeConfig.safeBlockVertical * 1.8),
                        border: InputBorder.none),
                  ),
                ),
              ),

              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
                      color: Colors.white,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: searchQuery != "" && searchQuery != null
                            ? FirebaseFirestore.instance
                                .collection('visitors')
                                .where("searchIndex",
                                    arrayContains: searchQuery)
                                .snapshots()
                            : FirebaseFirestore.instance
                                .collection("visitors")
                                .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return LoadingCircle();
                            default:
                              return new ListView(
                                children: snapshot.data.docs
                                    .map((DocumentSnapshot document) {
                                  return new AddCheckInVisitorCard(
                                      // customerId: document.documentID,
                                      firstName: document['firstName'],
                                      lastName: document['lastName'],
                                      gender: document['gender'],
                                      email: document['email'],
                                      phoneNumber: document['phoneNumber']);
                                }).toList(),
                              );
                          }
                        },
                      ))),
            ],
          ),
        )));
  }
}
