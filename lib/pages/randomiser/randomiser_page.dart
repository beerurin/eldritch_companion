/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/components/bottom_navigation.dart';
import 'package:eldritch_companion/components/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RandomiserPage extends StatelessWidget {
  const RandomiserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomiser'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
          const SettingsButton(),
        ],
      ),
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
