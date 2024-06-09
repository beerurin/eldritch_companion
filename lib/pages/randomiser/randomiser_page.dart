/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:flutter/material.dart';
import 'package:eldritch_companion/models/game_data_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RandomiserPage extends StatefulWidget {
  const RandomiserPage({super.key});

  @override
  State<StatefulWidget> createState() => _RandomiserPageState();
}

class _RandomiserPageState extends State<RandomiserPage> {
  int cardsToGenerate = 2;
  bool duplicateCards = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => showMaterialModalBottomSheet(
                expand: false,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                builder: (context) => FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const SizedBox(
                            height: 300,
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
                      return const SizedBox(
                        height: 300,
                        child: Center(
                          child: Text('Nothing to show :('),
                        ),
                      );
                    }),
              ),
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
