/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.selectedIndex,
      destinations: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.query_stats)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.question_mark_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.autorenew)),
        IconButton(
            onPressed: () => {}, icon: const Icon(Icons.settings_outlined))
      ],
    );
  }
}
