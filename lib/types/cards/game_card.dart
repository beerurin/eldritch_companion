/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:json_annotation/json_annotation.dart';

part 'game_card.g.dart';

@JsonSerializable()
class GameCard {
  final String name;
  final String gameSet;

  String wikiUrl = '';
  bool hasReckoning = false;

  GameCard(this.name, this.gameSet);

  factory GameCard.fromJson(Map<String, dynamic> json) =>
      _$GameCardFromJson(json);
  Map<String, dynamic> toJson() => _$GameCardToJson(this);

  @override
  bool operator ==(other) => other is GameCard && other.name == name;

  @override
  int get hashCode => name.hashCode;
}
