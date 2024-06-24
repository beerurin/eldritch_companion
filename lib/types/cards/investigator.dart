/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/types/cards/game_card.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investigator.g.dart';

@JsonSerializable()
class Investigator extends GameCard {
  final String occupation;
  final String portraitUrl;

  final int maxHealth;
  final int maxSanity;

  final List<String> roles;
  final List<String> abilities;

  final int loreSkill;
  final int influenceSkill;
  final int observationSkill;
  final int strengthSkill;
  final int willSkill;

  Investigator(
    super.name,
    super.gameSet,
    this.occupation,
    this.portraitUrl,
    this.maxHealth,
    this.maxSanity,
    this.roles,
    this.abilities,
    this.loreSkill,
    this.influenceSkill,
    this.observationSkill,
    this.strengthSkill,
    this.willSkill,
  );

  String getRolesString() {
    return roles.join(", ");
  }

  List<Widget> getActionsWidgets() {
    List<Widget> widgets = List.empty(growable: true);
    for (var ability in abilities) {
      widgets.add(Text(ability));
    }
    return widgets;
  }

  factory Investigator.fromJson(Map<String, dynamic> json) =>
      _$InvestigatorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InvestigatorToJson(this);

  @override
  bool operator ==(other) => other is Investigator && other.name == name;

  @override
  int get hashCode => name.hashCode;
}
