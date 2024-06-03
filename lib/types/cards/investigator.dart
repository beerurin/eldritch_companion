/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/types/cards/game_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investigator.g.dart';

@JsonSerializable()
class Investigator extends GameCard {
  final String occupation;

  Investigator(super.name, super.gameSet, this.occupation);

  factory Investigator.fromJson(Map<String, dynamic> json) =>
      _$InvestigatorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InvestigatorToJson(this);

  @override
  bool operator ==(other) => other is Investigator && other.name == name;

  @override
  int get hashCode => name.hashCode;
}
