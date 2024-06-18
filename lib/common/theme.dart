/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/common/constants.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: 'Inter',
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
      color: Colors.black,
    ),
  ),
  buttonTheme: const ButtonThemeData(
      minWidth: 100,
      buttonColor: Colors.red,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(defaultCircularRadius))),
);
