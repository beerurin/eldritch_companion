import 'package:cached_network_image/cached_network_image.dart';
import 'package:eldritch_companion/types/cards/investigator.dart';
import 'package:flutter/material.dart';

class InvestigatorDetailsPage extends StatelessWidget {
  const InvestigatorDetailsPage({super.key, required this.investigatorCard});

  final Investigator investigatorCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(investigatorCard.name),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                CachedNetworkImage(imageUrl: investigatorCard.portraitUrl),
                const Text('Occupation'),
                Text(investigatorCard.occupation),
                Text(investigatorCard.roles.length > 1 ? "Roles" : "Role"),
                Text(investigatorCard.getRolesString()),
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Health & Sanity"),
                  Row(
                    children: [
                      Text("Health: ${investigatorCard.maxHealth.toString()}"),
                      Text("Sanity: ${investigatorCard.maxSanity.toString()}"),
                    ],
                  ),
                  const Text("Skills"),
                  Row(
                    children: [
                      Text("L: ${investigatorCard.loreSkill.toString()}"),
                      Text("I: ${investigatorCard.influenceSkill.toString()}"),
                      Text(
                          "O: ${investigatorCard.observationSkill.toString()}"),
                      Text("S: ${investigatorCard.strengthSkill.toString()}"),
                      Text("W: ${investigatorCard.willSkill.toString()}"),
                    ],
                  ),
                  const Text("Starting location"),
                  const Text("Work in progress"),
                  const Text("Set"),
                  Text(investigatorCard.gameSet),
                  const Text("Actions"),
                  Column(
                    children: investigatorCard.getActionsWidgets(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
