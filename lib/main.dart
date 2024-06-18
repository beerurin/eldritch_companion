/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>. */

import 'package:eldritch_companion/common/constants.dart';
import 'package:eldritch_companion/common/theme.dart';
import 'package:eldritch_companion/models/app_settings_model.dart';
import 'package:eldritch_companion/pages/app_settings_page.dart';
import 'package:eldritch_companion/pages/cube_simulator_page.dart';
import 'package:eldritch_companion/pages/games_page.dart';
import 'package:eldritch_companion/pages/randomiser/randomiser_page.dart';
import 'package:eldritch_companion/models/game_data_model.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:eldritch_companion/pages/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const EldritchCompanionApp());

class EldritchCompanionApp extends StatelessWidget {
  const EldritchCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: appTheme,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  static const appBarTitles = [
    'Games',
    'Statistics',
    'Cube simulator',
    'Randomiser',
    'Settings',
  ];

  static const navBarIcons = [
    Icons.home,
    Icons.stacked_bar_chart,
    Icons.sentiment_neutral_outlined,
    Icons.question_mark,
    Icons.settings,
  ];

  Widget pageChooser(int index) {
    switch (index) {
      case 0:
        return const GamesPage();
      case 1:
        return const StatisticsPage();
      case 2:
        return const CubeSimulatorPage();
      case 3:
        return Provider(
          create: (context) => GameDataModel(),
          child: const RandomiserPage(),
        );
      case 4:
        return Provider(
          create: (context) => AppSettingsModel(),
          child: const AppSettingsPage(),
        );
      default:
        return Center(
          child: Text('Invalid index: $index'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: appTheme,
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(appBarTitles[currentPageIndex]),
        ),
        body: SafeArea(child: pageChooser(currentPageIndex)),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: currentPageIndex == 2
                ? navBarIcons.length - 1
                : navBarIcons.length,
            tabBuilder: (int index, bool isActive) {
              if (currentPageIndex == 2 && index >= 2) {
                return Icon(navBarIcons[index + 1]);
              }
              return Icon(navBarIcons[index]);
            },
            activeIndex: currentPageIndex,
            gapLocation:
                currentPageIndex == 2 ? GapLocation.center : GapLocation.none,
            onTap: (int index) {
              if (currentPageIndex == 2 && index >= 2) {
                setState(() => currentPageIndex = index + 1);
              } else {
                setState(() => currentPageIndex = index);
              }
            }),
        floatingActionButtonLocation: currentPageIndex == 2
            ? FloatingActionButtonLocation.centerDocked
            : null,
        floatingActionButton: currentPageIndex == 2
            ? FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {},
                child: Icon(navBarIcons[2]),
              )
            : null,
      ),
    );
  }
}
