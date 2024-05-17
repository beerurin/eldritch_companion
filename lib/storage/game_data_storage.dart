/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'dart:io';
import 'dart:convert';
import 'package:eldritch_companion/common/constants.dart';
import 'package:eldritch_companion/investigator.dart';

class GameDataStorage {
  List<Investigator> getRandomInvestigators(int count) {
    List<Investigator> investigators = List.empty(growable: true);
    for (var i = 0; i < count; i++) {
      Investigator inv =
          Investigator('name', 'occupation', 'gameSet', 'wikiUrl');
      investigators.add(inv);
    }
    return investigators;
  }
}
