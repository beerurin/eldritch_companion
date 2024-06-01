/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

// ignore_for_file: avoid_print
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:eldritch_companion/common/constants.dart';

Future<String> fetchWikiWebpageContent(String path) async {
  final resp = await http.get(Uri.http(wikiSite, path));

  if (resp.statusCode == 200) {
    return resp.body;
  } else {
    throw Exception('Failed to fetch data');
  }
}

Future<bool> writeStringToFile(String path, String data) async {
  try {
    await File(path).writeAsString(data);
    print('Wrote investigators data to $path');
    return true;
  } on FileSystemException catch (exception) {
    print('Failed to write a file: $exception');
    return false;
  }
}
