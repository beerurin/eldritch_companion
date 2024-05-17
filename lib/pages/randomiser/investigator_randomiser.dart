/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:flutter/material.dart';

class InvestigatorRandomiser extends StatefulWidget {
  const InvestigatorRandomiser({super.key});

  @override
  State<StatefulWidget> createState() => _InvestigatorRandomiserState();
}

class _InvestigatorRandomiserState extends State<InvestigatorRandomiser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Random investigator'),
        ),
        body: const Center(
          child: Text('bruv'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.autorenew),
          onPressed: () {},
        ));
  }
}
