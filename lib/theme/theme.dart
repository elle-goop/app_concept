import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Palette.mainBlue,
  // textTheme: TextTheme(),
);

class Palette {
  static const Color mainBlue = Color.fromRGBO(3, 33, 213, 1);
  static const Color mainBlueT = Color.fromRGBO(3, 33, 213, 0.5);
  static const Color mainBlueDark1 = Color.fromRGBO(0, 9, 167, 1);
  static const Color mainBlueDark2 = Color.fromRGBO(19, 27, 91, 1);
  static const Color mainRed = Color.fromRGBO(242, 0, 45, 1);
  static const Color mainPurple = Color.fromRGBO(131, 29, 167, 1);
  static const Color mainWhite = Color.fromRGBO(255, 255, 255, 1);
  static const Color whiteTransparent = Color.fromRGBO(255, 255, 255, 0.0);


  static const Color textBlack = Color.fromRGBO(14, 14, 14, 1);
  static const Color textGrey = Color.fromRGBO(165, 165, 165, 1);
}

Animation<double> animateOpacity(
  double begin,
  double end,
  AnimationController controller,
  {Interval interval: const Interval(0.0, 0.0, curve: Curves.easeIn)}) => Tween<double>(
      begin: begin, end: end)
      .animate(CurvedAnimation(
        curve: interval,
        parent: controller,
    ));

class Motion {

}