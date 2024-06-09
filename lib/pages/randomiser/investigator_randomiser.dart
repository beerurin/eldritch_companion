/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/types/cards/investigator.dart';
import 'package:eldritch_companion/models/game_data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvestigatorRandomiser extends StatefulWidget {
  const InvestigatorRandomiser({super.key});

  @override
  State<StatefulWidget> createState() => _InvestigatorRandomiserState();
}

class _InvestigatorRandomiserState extends State<InvestigatorRandomiser> {
  late GameDataModel gameDataModel;
  late Future<List<Investigator>> _getRandomInvestigators;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    gameDataModel = Provider.of<GameDataModel>(context);
    _getRandomInvestigators = gameDataModel.getRandomInvestigators(3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Random investigator'),
        ),
        body: FutureBuilder(
          future: _getRandomInvestigators,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              final List<Investigator>? randomInvestigators = snapshot.data;
              return Center(
                child: Text(randomInvestigators![0].name),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            }
            return const Center(
              child: Text('Something went very wrong...'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.autorenew),
          onPressed: () => {},
        ));
  }
}
