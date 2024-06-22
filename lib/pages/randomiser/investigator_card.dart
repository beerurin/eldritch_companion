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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: widget.card.portraitUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
        ),
        Text(widget.card.occupation),
        Text(widget.card.name),
      ],
    );
  }
}
