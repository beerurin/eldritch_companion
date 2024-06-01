/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'dart:convert';
import 'package:eldritch_companion/common/constants.dart';
import 'package:eldritch_companion/extensions/list.dart';
import 'package:eldritch_companion/investigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class GameDataModel {
  List<Investigator> _investigators = List.empty();

  Future _getInvestigatorsFromDisk() async {
    if (kDebugMode) {
      await Future.delayed(const Duration(seconds: 1));
    }

    var investigatorsJson = await rootBundle.loadString(investigatorsFilePath);
    final decodedList = jsonDecode(investigatorsJson) as List<dynamic>;
    _investigators = decodedList
        .map((e) => Investigator.fromJson(e as Map<String, dynamic>))
        .toList();

    if (kDebugMode) {
      print('Read investigator data from disk');
    }
  }

  Future<List<Investigator>> getRandomInvestigators(int count) async {
    if (_investigators.isEmpty) {
      await _getInvestigatorsFromDisk();
    }

    List<Investigator> inv = List.empty(growable: true);

    for (var i = 0; i < count; i++) {
      var randomInvestigator = _investigators.randomItem();
      while (inv.hasItem(randomInvestigator)) {
        randomInvestigator = _investigators.randomItem();
      }
      inv.add(randomInvestigator);
    }

    return inv;
  }
}
