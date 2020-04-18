import 'package:flutter/material.dart';
import 'home.dart';

//Theme data
final Color primaryColor = Colors.purple;
final Color secondaryColor = Colors.white;
final Color primaryTextColor = Colors.white;
final Color secondaryTextColor=Colors.grey;

final double titleFontSize = 24;

TextStyle setTextStyle(
    {color = Colors.black,
    double size = 14,
    //family = 'Montserrat',
    weight = FontWeight.normal
}) {
  return TextStyle(
    fontWeight: weight,
    color: color,
    fontSize: size,
    //fontFamily: family,
  );
}

class GlobalCache {
  GlobalCache._privateConstructor();
  static final GlobalCache instance = GlobalCache._privateConstructor();

  double fontSize = 14;
}