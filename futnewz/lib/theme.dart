import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:futnewz/colors.dart';
import 'constant.dart';

ThemeData theme = ThemeData(
  fontFamily: 'Arial',
  textTheme: textTheme,
  accentIconTheme: iconThemeData,
  primaryIconTheme: iconThemeData,
  iconTheme: iconThemeData,
  appBarTheme: AppBarTheme(
    color: kWhiteBackgroundColor,
    elevation: 0.0,
  ),
);

TextTheme textTheme = TextTheme(
  headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  headline6: TextStyle(
    fontSize: kTitleSize,
    fontWeight: FontWeight.bold,
  ),
  bodyText2: TextStyle(
    fontSize: kDefaultTextSize,
    color: kDisabledTextColor,
  ),
);

IconThemeData iconThemeData = IconThemeData(
  size: kDefaultIconSize,
  color: kAccentColor,
);

const TextStyle kTitle = TextStyle(
  fontSize: kTitleSize,
  fontWeight: FontWeight.bold,
  color: kDefaultTextColor,
);
const TextStyle kTitleCard = TextStyle(
  fontSize: kTitleSize,
  fontWeight: FontWeight.bold,
  color: kWhiteBackgroundColor,
);
const TextStyle kAppbarTitle = TextStyle(
  fontSize: kTitleSize,
  color: kAccentColor,
);
const TextStyle kDescription = TextStyle(
  fontSize: kDescrptionSize,
  color: kDisabledTextColor,
);
