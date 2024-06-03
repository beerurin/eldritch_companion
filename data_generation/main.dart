/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. 

In order for app to work, data must be parsed using this code.
Just run in terminal with 'dart parser.dart' and it will do all the magic 
automatically. */

import 'package:eldritch_companion/common/constants.dart';

import 'dart:convert';
import 'common.dart';
import 'constants.dart';
import 'wiki/investigator_parser.dart';

void main() async {
  final content = await fetchWikiWebpageContent(wikiInvestigatorsPath);
  final investigators = await parseInvestigators(content);
  await writeStringToFile(
      "../../$investigatorsFilePath", jsonEncode(investigators));
}
