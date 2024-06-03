/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. 

In order for app to work, data must be parsed using this code.
Just run in terminal with 'dart parser.dart' and it will do all the magic 
automatically. */

// ignore_for_file: avoid_print
import 'package:eldritch_companion/common/constants.dart';
import 'package:args/args.dart';

import 'dart:convert';
import 'common.dart';
import 'constants.dart';
import 'wiki/investigator_parser.dart';

Future<int> main(List<String> arguments) async {
  var parser = ArgParser();
  parser.addFlag('all',
      abbr: 'a', help: 'Generates all data needed for the app to function');
  parser.addFlag('cards', abbr: 'c', help: 'Only parse cards');
  parser.addFlag('investigators',
      abbr: 'i', help: 'Only parse investigator cards');

  final argResults = parser.parse(arguments);

  if (argResults.wasParsed('all')) {
    print('Parsing everything need for the app');
    fetchAndWriteInvestigators();
    return 0;
  }

  if (argResults.wasParsed('cards')) {
    print('Will parse all cards');
    fetchAndWriteInvestigators();
    return 0;
  }

  if (argResults.wasParsed('investigators')) {
    print('Will only parse investigators');
    fetchAndWriteInvestigators();
  }

  return 0;
}

Future<bool> fetchAndWriteInvestigators() async {
  final content = await fetchWikiWebpageContent(wikiInvestigatorsPath);
  final investigators = await parseInvestigators(content);
  return await writeStringToFile(
      "../$investigatorsFilePath", jsonEncode(investigators));
}
