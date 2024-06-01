/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/models/app_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  late AppSettingsModel appSettingsModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appSettingsModel = Provider.of<AppSettingsModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const Text('A text'),
          const Text('Another text'),
          Text("Some boolean: ${appSettingsModel.justSomeBoolean.toString()}"),
        ],
      ),
    );
  }
}
