/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:flutter/material.dart';

// Design
const defaultCircularRadius = Radius.circular(12);
const defaultRoundedRectangleTop = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
      topLeft: defaultCircularRadius, topRight: defaultCircularRadius),
);

// Shadows
const subtleShadow =
    BoxShadow(color: Colors.black12, offset: Offset(0, 0), blurRadius: 5);

// Colors
const Color conditionColor = Color.fromRGBO(111, 101, 101, 1);
const Color conditionColorAccent = Color.fromRGBO(188, 184, 184, 1);
const Color spellColor = Color.fromRGBO(142, 114, 166, 1);
const Color spellColorAccent = Color.fromRGBO(211, 202, 218, 1);
const Color uniqueAssetColor = Color.fromRGBO(225, 183, 102, 1);
const Color uniqueAssetColorAccent = Color.fromRGBO(240, 222, 189, 1);
const Color investigatorColor = Color.fromRGBO(172, 107, 102, 1);
const Color investigatorAccent = Color.fromRGBO(223, 189, 184, 1);

final appTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Colors.grey[200],
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
      color: Colors.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(128, 48),
          backgroundColor: Colors.grey[200],
          textStyle: const TextStyle(color: Colors.black),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(defaultCircularRadius)))),
);
