/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. 

In order for app to work, data must be parsed using this code.
Just run in terminal with 'dart parser.dart' and it will do all the magic 
automatically. */

// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:convert';
import 'package:eldritch_companion/constants.dart';
import 'constants.dart';
import 'package:eldritch_companion/investigator.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

Future<String> fetchWikiWebpageContent(String path) async {
  final resp = await http.get(Uri.http(wikiSite, path));

  if (resp.statusCode == 200) {
    return resp.body;
  } else {
    throw Exception('Failed to fetch data');
  }
}

// Function to parse the Investigator data from the HTML table
Future<List<Investigator>> parseInvestigators(String content) async {
  final document = parser.parse(content);

  // Locate the table containing investigator data (replace with specific selector if needed)
  final table = document.querySelector('table.article-table');

  if (table == null) {
    throw Exception('Failed to find investigator table');
  }

  final rows = table.querySelectorAll('tr');
  final investigators = <Investigator>[];

  // Skip the header row
  for (var row in rows.skip(1)) {
    final cells = row.querySelectorAll('td');
    if (cells.isNotEmpty) {
      // Assuming investigator name is in the first cell
      final nameCell = cells[0];
      final name = nameCell.text.trim();
      // Extract URL from the first anchor tag within the name cell (assuming the URL is present there)
      final wikiUrl = nameCell.querySelector('a')?.attributes['href'];

      final occupation = cells[1].text.trim();

      final gameSet = cells[2].querySelector('a')?.attributes['title'];

      investigators.add(Investigator(
          name, occupation, gameSet ?? 'Unknown addon', wikiUrl ?? ''));
    }
  }

  return investigators;
}

void main() async {
  final content = await fetchWikiWebpageContent(wikiInvestigatorsPath);
  final investigators = await parseInvestigators(content);

  try {
    const path = parsedDataPath + investigatorsFile;
    await File(path).writeAsString(jsonEncode(investigators));
    print('Wrote investigators data to $path');
  } on FileSystemException catch (exception) {
    print('Failed to write a file: $exception');
  }
}
