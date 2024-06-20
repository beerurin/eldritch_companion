/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

// ignore_for_file: avoid_print

import 'package:eldritch_companion/types/cards/investigator.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

import '../common.dart';
import '../constants.dart';

List<String> _parseInvestigatorUrls(String content) {
  final document = parser.parse(content);

  // Locate the table containing investigator data (replace with specific selector if needed)
  final table = document.querySelector('table.article-table');

  if (table == null) {
    throw Exception('Failed to find investigator table');
  }

  final rows = table.querySelectorAll('tr');
  final urls = List<String>.empty(growable: true);

  // Skip the header row
  for (var row in rows.skip(1)) {
    final cells = row.querySelectorAll('td');
    if (cells.isNotEmpty) {
      // Assuming investigator name is in the first cell
      final nameCell = cells[0];
      // Extract URL from the first anchor tag within the name cell (assuming the URL is present there)
      final wikiUrlParsed = nameCell.querySelector('a')?.attributes['href'];
      if (wikiUrlParsed != null) {
        final url = Uri.decodeFull(wikiUrlParsed);
        urls.add(url);
      } else {
        print("Failed to parse URL for investigator: ${nameCell.text}");
      }
    }
  }

  print('Parsed ${urls.length.toString()} investigator URLs');
  return urls;
}

// Function to parse the Investigator data from the HTML table
Future<List<Investigator>> parseInvestigators(String content) async {
  List<Investigator> investigators = List.empty(growable: true);
  List<String> urls = _parseInvestigatorUrls(content);

  // investigator loop
  String investigatorPageContent;
  Document document;
  Element? infoBox;

  for (var i = 0; i < urls.length; i++) {
    investigatorPageContent = await fetchWikiWebpageContent(urls[i]);
    document = parser.parse(investigatorPageContent);
    infoBox = document.querySelector("aside.$portableInfoboxClass");

    final String? name =
        infoBox?.querySelector("[$dataSourceAttribute='name']")?.text.trim();

    String? gameSet = infoBox
        ?.querySelector("[$dataSourceAttribute='set'] div div div a")
        ?.attributes['title'];
    gameSet ??= "Core";

    final String? occupation = infoBox
        ?.querySelector(
            "[$dataSourceAttribute='profession'] div.$dataValueClass")
        ?.text
        .trim();

    String? portraitUrl = infoBox
        ?.querySelector("[$dataSourceAttribute='image'] a.image")
        ?.attributes['href'];
    RegExp exp = RegExp('.*(png|jpg|jpeg|webp)/');
    RegExpMatch? match = exp.firstMatch(portraitUrl!);
    portraitUrl = Uri.decodeFull(match![0]!);

    final String? rolesString = infoBox
        ?.querySelector("[$dataSourceAttribute='role'] div.$dataValueClass")
        ?.text;
    List<String> roles = rolesString!.split(', ');
    for (var role in roles) {
      role.trim();
    }

    final String maxHealthString =
        infoBox!.querySelector("[$dataSourceAttribute='health']")!.text.trim();
    exp = RegExp('[0-9].*');
    match = exp.firstMatch(maxHealthString);
    final int maxHealth = int.parse(match![0]!);

    final String maxSanityString =
        infoBox.querySelector("[$dataSourceAttribute='sanity']")!.text.trim();
    match = exp.firstMatch(maxSanityString);
    final int maxSanity = int.parse(match![0]!);

    final String loreString =
        infoBox.querySelector("td[$dataSourceAttribute='lore']")!.text.trim();
    final int loreSkill = int.parse(loreString);

    final String influenceString = infoBox
        .querySelector("td[$dataSourceAttribute='influence']")!
        .text
        .trim();
    final int influenceSkill = int.parse(influenceString);

    final String observationString = infoBox
        .querySelector("td[$dataSourceAttribute='observation']")!
        .text
        .trim();
    final int observationSkill = int.parse(observationString);

    final String strengthString = infoBox
        .querySelector("td[$dataSourceAttribute='strength']")!
        .text
        .trim();
    final int strengthSkill = int.parse(strengthString);

    final String willString =
        infoBox.querySelector("td[$dataSourceAttribute='will']")!.text.trim();
    final int willSkill = int.parse(willString);

    Investigator newInvestigator = Investigator(
        name!,
        gameSet,
        occupation!,
        portraitUrl,
        maxHealth,
        maxSanity,
        roles,
        ['Sorry', 'Nothing :('],
        loreSkill,
        influenceSkill,
        observationSkill,
        strengthSkill,
        willSkill);
    newInvestigator.wikiUrl = urls[i];
    investigators.add(newInvestigator);
  }

  return investigators;
}
