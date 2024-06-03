/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:json_annotation/json_annotation.dart';

part 'investigator.g.dart';

@JsonSerializable()
class Investigator {
  final String name;
  final String occupation;
  final String gameSet;
  final String wikiUrl;

  Investigator(
    this.name,
    this.occupation,
    this.gameSet,
    this.wikiUrl,
  );

  factory Investigator.fromJson(Map<String, dynamic> json) =>
      _$InvestigatorFromJson(json);
  Map<String, dynamic> toJson() => _$InvestigatorToJson(this);

  @override
  bool operator ==(other) => other is Investigator && other.name == name;

  @override
  int get hashCode => name.hashCode;
}
