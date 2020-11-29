import 'package:flutter/material.dart';
import 'package:pdcc_teku/visitor_add.dart';
import 'package:pdcc_teku/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdcc_teku/visitor_card.dart';
import 'package:pdcc_teku/misc.dart';

class VisitorMain extends StatefulWidget {
  @override
  _VisitorMainState createState() => _VisitorMainState();
}

class _VisitorMainState extends State<VisitorMain> {
  String searchQuery = '';

  void initiateSearch(String val) {
    setState(() {
      searchQuery = val.toLowerCase().trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset('assets/Menu.png'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
          ),
          title: Text(
            'VISITOR',
            style: TextStyle(color: Color(0xff2699fb)),
            textScaleFactor: SizeConfig.safeBlockVertical * 0.1,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            GestureDetector(
              child: Image.asset('assets/Add.png'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VisitorAdd())),
            )
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
                              .where("searchIndex", arrayContains: searchQuery)
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
                                return new VisitorCard(
                                  documentId: document.id,
                                  firstName: document['firstName'],
                                  lastName: document['lastName'],
                                  gender: document['gender'],
                                  email: document['email'],
                                  phoneNumber: document['phoneNumber'],
                                );
                              }).toList(),
                            );
                        }
                      },
                    ))),
          ],
        ));
  }
}
