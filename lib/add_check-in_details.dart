import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdcc_teku/add_check-in_confirm.dart';
import 'package:pdcc_teku/misc.dart';

class AddCheckInDetails extends StatefulWidget {
  AddCheckInDetails(
      {@required this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.checkInDate,
      this.checkInTime});

  final firstName;
  final lastName;
  final email;
  final phoneNumber;
  final checkInDate;
  final checkInTime;

  @override
  _AddCheckInDetailsState createState() => _AddCheckInDetailsState(
      firstName, lastName, email, phoneNumber, checkInDate, checkInTime);
}

class _AddCheckInDetailsState extends State<AddCheckInDetails> {
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _email;
  String _checkInDate;
  String _checkInTime;

  _AddCheckInDetailsState(this._firstName, this._lastName, this._email,
      this._phoneNumber, this._checkInDate, this._checkInTime);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _timeController = new TextEditingController();

  Future _chooseTime(BuildContext context, String initialTimeString) async {
    var now = new TimeOfDay.now();
    TimeOfDay t = await showTimePicker(context: context, initialTime: now);

    if (t == null) return;

    setState(() {
      _timeController.text = t.format(context);
      _checkInTime = _timeController.text;
    });
  }

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
      _checkInDate = _controller.text;
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  bool isValidDob(String dob) {
    if (dob.isNotEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }

  bool isValidTime(String time) {
    if (time.isNotEmpty)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              leading: GestureDetector(
                child: Image.asset('assets/Back.png'),
                onTap: () => Navigator.pop(context),
              ),
              title: Text(
                'CHECK IN DETAILS',
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
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Timeline
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 2.5,
                                left: SizeConfig.blockSizeHorizontal * 2.5,
                                right: SizeConfig.blockSizeHorizontal * 2.5),
                            child: ScreenProgress(ticks: 2),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 7.5,
                                left: SizeConfig.blockSizeHorizontal * 7.5,
                                right: SizeConfig.blockSizeHorizontal * 7.5),
                            child: Text(
                              "Date",
                              style: TextStyle(
                                  color: Color(0xff2699fb),
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1,
                            ),
                          ),

                          Container(
                            // padding: EdgeInsets.only(top: 10),
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 7.5,
                                right: SizeConfig.blockSizeHorizontal * 7.5),
                            child: Row(children: <Widget>[
                              new Expanded(
                                  child: new TextFormField(
                                decoration: new InputDecoration(),
                                controller: _controller,
                                onTap: () => [
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide'),
                                  _chooseDate(context, "")
                                ],
                                validator: (val) =>
                                    isValidDob(val) ? null : 'Date is invalid',
                                onSaved: (value) =>
                                    _checkInDate = value.toString(),
                              )),
                              new IconButton(
                                icon: new Icon(Icons.calendar_today),
                                tooltip: 'Choose date',
                                onPressed: (() {
                                  _chooseDate(context, _controller.text);
                                }),
                              ),
                            ]),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 7.5,
                                left: SizeConfig.blockSizeHorizontal * 7.5,
                                right: SizeConfig.blockSizeHorizontal * 7.5),
                            child: Text(
                              "Time",
                              style: TextStyle(
                                  color: Color(0xff2699fb),
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 7.5,
                                right: SizeConfig.blockSizeHorizontal * 7.5),
                            child: Row(children: <Widget>[
                              new Expanded(
                                  child: new TextFormField(
                                decoration: new InputDecoration(),
                                controller: _timeController,
                                onTap: () => [
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide'),
                                  _chooseTime(context, "")
                                ],
                                validator: (val) =>
                                    isValidTime(val) ? null : 'Time is invalid',
                                onSaved: (value) =>
                                    _checkInTime = value.toString(),
                              )),
                              new IconButton(
                                icon: new Icon(Icons.schedule),
                                tooltip: 'Choose time',
                                onPressed: (() {
                                  _chooseTime(context, _timeController.text);
                                }),
                              ),
                            ]),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 7.5,
                                left: SizeConfig.blockSizeHorizontal * 7.5,
                                right: SizeConfig.blockSizeHorizontal * 10),
                            width: double.infinity,
                            height: SizeConfig.blockSizeVertical * 6,
                            child: RaisedButton(
                                color: Color(0xff2699fb),
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  final FormState form = _formKey.currentState;

                                  if (!form.validate()) {
                                    errorDialog(context);
                                  } else {
                                    form.save(); //This invokes each onSaved event

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddCheckInConfirm(
                                                  firstName: _firstName,
                                                  lastName: _lastName,
                                                  email: _email,
                                                  phoneNumber: _phoneNumber,
                                                  checkInDate: _checkInDate,
                                                  checkInTime: _checkInTime,
                                                )));
                                  }
                                }),
                          ),
                        ],
                      ),
                    )))));
  }
}

Future errorDialog(BuildContext context) {
  return showDialog(
    builder: (context) {
      return AlertDialog(
        title: Text('Invalid Form'),
        content: Text("All details are required to submit the form"),
        actions: <Widget>[
          FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      );
    },
    context: context,
  );
}
