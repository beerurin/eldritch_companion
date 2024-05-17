/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RandomCardsPage extends StatelessWidget {
  const RandomCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => context.go('/randomiser/investigator'),
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
      ),
      bottomNavigationBar: const BottomNavigation(
        selectedIndex: 1,
      ),
    );
  }
}
