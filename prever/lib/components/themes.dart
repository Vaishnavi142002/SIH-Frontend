import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: "Outfit",
      fontSize: 32,
      fontWeight: FontWeight.w500
    ),
    displaySmall: TextStyle(
      fontFamily: "Outfit",
      fontSize: 18,
      fontWeight: FontWeight.w500
    ),
  )
);

const headline1 = TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.w600);
const headline2 = TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600);
const normalText = TextStyle(
  fontFamily: "Outfit",
  color: Colors.black,
  fontSize: 12,
);
const boldNormalText = TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold);

const headline1_dark = TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600);
const headline2_dark = TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600);
const normalText_dark = TextStyle(
  fontFamily: "Outfit",
  color: Colors.black,
  fontSize: 12,
);
const boldNormalText_dark = TextStyle(
    fontFamily: "Outfit",
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold);

class Themes {
  static final light = ThemeData.light().copyWith(
      //backgroundColor: Colors.black,
      backgroundColor: Colors.black,
      dividerColor: Colors.black,
      textTheme: TextTheme(
          headline1: headline1,
          headline2: headline2,
          bodyText1: normalText,
          bodyText2: boldNormalText),
      iconTheme: IconThemeData(color: Colors.black));
  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Colors.black,
      dividerColor: Colors.black,
      textTheme: TextTheme(
          headline1: headline1_dark,
          headline2: headline2_dark,
          bodyText1: normalText_dark,
          bodyText2: boldNormalText_dark),
      iconTheme: IconThemeData(color: Colors.black));
}