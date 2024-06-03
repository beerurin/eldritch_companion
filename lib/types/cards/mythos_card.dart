/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/types/cards/game_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mythos_card.g.dart';

@JsonSerializable()
class MythosCard extends GameCard {
  MythosCard(super.name, super.gameSet);

  factory MythosCard.fromJson(Map<String, dynamic> json) =>
      _$MythosCardFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MythosCardToJson(this);

  @override
  bool operator ==(other) => other is MythosCard && other.name == name;

  @override
  int get hashCode => name.hashCode;
}
