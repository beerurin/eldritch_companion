/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/pages/randomiser/investigator_randomiser.dart';
import 'package:flutter/material.dart';

class RandomCardsPage extends StatelessWidget {
  const RandomCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InvestigatorRandomiser()))
              },
              child: const Row(
                children: [
                  Icon(Icons.search),
                  Text('Investigator'),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => {},
                child: const Text('I don\'t do anything :('))
          ],
        )
      ],
    );
  }
}
