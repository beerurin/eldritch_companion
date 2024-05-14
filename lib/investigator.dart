import 'package:json_annotation/json_annotation.dart';

part 'investigator.g.dart';

@JsonSerializable()
class Investigator {
  final String name;
  final String occupation;
  final String addon;
  final String wikiUrl;

  Investigator(
    this.name,
    this.occupation,
    this.addon,
    this.wikiUrl,
  );

  factory Investigator.fromJson(Map<String, dynamic> json) =>
      _$InvestigatorFromJson(json);
  Map<String, dynamic> toJson() => _$InvestigatorToJson(this);
}
