/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/investigator.dart';
import 'package:eldritch_companion/storage/game_data_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvestigatorRandomiser extends StatefulWidget {
  const InvestigatorRandomiser({super.key});

  @override
  State<StatefulWidget> createState() => _InvestigatorRandomiserState();
}

class _InvestigatorRandomiserState extends State<InvestigatorRandomiser> {
  @override
  Widget build(BuildContext context) {
    var investigatorsToShow =
        context.select<GameDataStorage, List<Investigator>>(
      (gameDataStorage) => gameDataStorage.getRandomInvestigators(1),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Random investigator'),
        ),
        body: investigatorsToShow.length > 1
            ? Text('More than one!!! ${investigatorsToShow[0].name}')
            : Text(investigatorsToShow[0].name),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.autorenew),
          onPressed: () {
            setState(() {});
          },
        ));
  }
}
