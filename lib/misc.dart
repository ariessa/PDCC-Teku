import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}

class ScreenProgress extends StatelessWidget {
  final int ticks;

  ScreenProgress({@required this.ticks});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(children: <Widget>[
          tick1(),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          Text(
            "I",
            textScaleFactor: 0.7,
            style: TextStyle(
              color: Color(0xff2699fb),
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
        spacer(),
        Column(children: <Widget>[
          line(),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          Text(
            "       ",
            textScaleFactor: 0.7,
          )
        ]),
        spacer(),
        Column(children: <Widget>[
          tick2(),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          Text(
            "II",
            textScaleFactor: 0.7,
            style: TextStyle(
              color: Color(0xff2699fb),
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
        spacer(),
        Column(children: <Widget>[
          line(),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          Text(
            "       ",
            textScaleFactor: 0.7,
          )
        ]),
        spacer(),
        Column(children: <Widget>[
          tick3(),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          Text(
            "III",
            textScaleFactor: 0.7,
            style: TextStyle(
              color: Color(0xff2699fb),
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
        spacer(),
        Column(children: <Widget>[
          line(),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          Text(
            "       ",
            textScaleFactor: 0.7,
          )
        ]),
        spacer(),
        Column(children: <Widget>[
          tick4(),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          Text(
            "IV",
            textScaleFactor: 0.7,
            style: TextStyle(
              color: Color(0xff2699fb),
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      ],
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.brightness_1,
            color: Colors.blue,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: Colors.blue,
          );
  }

  Widget tick1() {
    return this.ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return this.ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return this.ticks > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return this.ticks > 3 ? tick(true) : tick(false);
  }

  Widget spacer() {
    return Container(
      width: 0,
    );
  }

  Widget line() {
    return Container(
      margin: EdgeInsets.only(top: 0),
      color: Colors.blue,
      height: SizeConfig.blockSizeVertical * 0.3,
      width: SizeConfig.blockSizeHorizontal * 11.8,
    );
  }
}
