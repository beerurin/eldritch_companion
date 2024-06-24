/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eldritch_companion/pages/card_details/investigator_details_page.dart';
import 'package:eldritch_companion/types/cards/investigator.dart';
import 'package:flutter/material.dart';

class InvestigatorEntry extends StatefulWidget {
  const InvestigatorEntry({super.key, required this.card});

  final Investigator card;

  @override
  State<StatefulWidget> createState() => _InvestigatorEntryState();
}

class _InvestigatorEntryState extends State<InvestigatorEntry> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  InvestigatorDetailsPage(investigatorCard: widget.card))),
      child: Container(
          height: 200,
          margin: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.card.portraitUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Text('Image failed to load\nError:${error.toString()}'),
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
          )),
    );
  }
}
