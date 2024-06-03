/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/types/investigator.dart';
import 'package:html/parser.dart' as parser;

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
