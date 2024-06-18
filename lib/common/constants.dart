/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:flutter/material.dart';

const String appName = 'Eldritch Companion';

const String wikiSite = "eldritchhorror.fandom.com";

// Game data files
const String investigatorsFilePath = 'assets/investigators.json';

// Design
const defaultCircularRadius = Radius.circular(12);
const defaultRoundedRectangleTop = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
      topLeft: defaultCircularRadius, topRight: defaultCircularRadius),
);
