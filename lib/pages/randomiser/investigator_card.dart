/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eldritch_companion/types/cards/investigator.dart';
import 'package:flutter/material.dart';

class InvestigatorCard extends StatefulWidget {
  const InvestigatorCard({super.key, required this.card});

  final Investigator card;

  @override
  State<StatefulWidget> createState() => _InvestigatorCardState();
}

class _InvestigatorCardState extends State<InvestigatorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        margin: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.card.portraitUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
            Text(
              widget.card.occupation,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              widget.card.name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }
}
