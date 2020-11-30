import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdcc_teku/menu.dart';
import 'package:pdcc_teku/add_check-in_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdcc_teku/check-in_card.dart';
import 'package:pdcc_teku/misc.dart';

class CheckInMain extends StatefulWidget {
  @override
  _CheckInMainState createState() => _CheckInMainState();
}

class _CheckInMainState extends State<CheckInMain> {
  String searchQuery = '';

  void initiateSearch(String val) {
    setState(() {
      searchQuery = val.toLowerCase().trim();
    });
  }

  var firestoreFemale;
  var firestoreMale;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Get document with ID female in collection genders
    FirebaseFirestore.instance
      .collection('genders')
      .doc('female')
      .get()
      .then((DocumentSnapshot documentSnapshot) {
      // Get value of field taskVal from document genders/female
      firestoreFemale= documentSnapshot.data()['taskVal'];

      // Get value of field taskVal from document genders/male
      firestoreMale = documentSnapshot.data()['taskVal'];
    });

    // Else, navigate to add check in screen
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child:     Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Menu.png'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
          ),
          title: Text(
            'CHECK IN',
            style: TextStyle(color: Color(0xff2699fb)),
            textScaleFactor: SizeConfig.safeBlockVertical * 0.1,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            GestureDetector(
              child: Image.asset('assets/Add.png'),
              onTap: () {
                // Check if number of visitor is 0 or not
                // If true, disable add check in button
                if (firestoreFemale + firestoreMale == 0) {
                  setState(() => false);
                  _showMyDialog(context);
                }
                else {
                  setState(() => true);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCheckInMain()));
                }
              }),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5, 
                    right: SizeConfig.blockSizeHorizontal * 5, 
                    top: SizeConfig.blockSizeVertical * 2.5, 
                    bottom: SizeConfig.blockSizeVertical * 1),
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
                          TextStyle(color: Color(0xff2699fb), fontSize: 14),
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
                              .collection('check-ins')
                              .where("searchIndex", arrayContains: searchQuery)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection("check-ins")
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
                                return new CheckInCard(
                                    // customerId: document.documentID,
                                    checkInId: document.id,
                                    firstName: document['firstName'],
                                    lastName: document['lastName'],
                                    email: document['email'],
                                    phoneNumber: document['phoneNumber'],
                                    checkInDate: document['checkInDate'],
                                    checkInTime: document['checkInTime']);
                              }).toList(),
                            );
                        }
                      },
                    ))),
          ],
        )));
  }

  Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child:       AlertDialog(
        title: Text('Cannot Add Check In'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Add check in requires at least 1 visitor')
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('CLOSE'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ));

    },
  );
}
}
