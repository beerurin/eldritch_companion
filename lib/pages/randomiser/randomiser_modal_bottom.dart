/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/models/game_data_model.dart';
import 'package:eldritch_companion/types/cards/game_card.dart';
import 'package:flutter/material.dart';

class RandomiserModalBottom extends StatefulWidget {
  const RandomiserModalBottom(
      {super.key,
      required this.gameDataModel,
      required this.cardCount,
      required this.cardType});

  final GameDataModel gameDataModel;
  final int cardCount;
  final Type cardType;

  @override
  State<StatefulWidget> createState() => _RandomiserModalBottomState();
}

class _RandomiserModalBottomState extends State<RandomiserModalBottom> {
  late Future<List<GameCard>> cardsFuture;

  static const double minimalHeight = 300;

  @override
  void initState() {
    super.initState();
    cardsFuture =
        widget.gameDataModel.getRandomCards(widget.cardCount, widget.cardType);
  }

  List<Widget> buildCardsFromList(List<GameCard>? cards) {
    List<Widget> widgets = List.empty(growable: true);
    if (cards == null) {
      return widgets;
    }
    for (var card in cards) {
      widgets.add(Text(card.name));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      FutureBuilder(
          future: cardsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const SizedBox(
                  height: minimalHeight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Reading data...'),
                      ],
                    ),
                  ));
            }
            if (snapshot.hasData) {
              final cards = snapshot.data;
              return Container(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(minHeight: minimalHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: buildCardsFromList(cards),
                    ),
                    ElevatedButton(
                        onPressed: () => setState(() {
                              cardsFuture = widget.gameDataModel.getRandomCards(
                                  widget.cardCount, widget.cardType);
                            }),
                        child: const Text('Reroll')),
                  ],
                ),
              );
            }
            return const SizedBox(
              height: minimalHeight,
              child: Center(
                child: Text('Nothing to show :('),
              ),
            );
          }),
    ]);
  }
}
