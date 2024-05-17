# Eldritch Companion

This app is work in progress for now.

It's designed to automate some things and provide statistics for your games.

List of planned features:
- Random card pulling
- Game result recording and various statitics based on those records
- Data backup to cloud/file
- Data import from [Eldritch Horror Assistant](https://play.google.com/store/apps/details?id=ru.mgusev.eldritchhorror).
The app seems to be abandoned, but I know people who has years of statistics in there!!

List of probably planned features, but I'm not sure if it's gonna be useful/plausible:
- Chances calculator

## Building

The app is built the same way as any other flutter project.
Although instructions will be added.

Before building the app run `dart run build_runner build`.

To get latest data from the wiki for the application to use
run `dart parser.dart` in the `parsing` directory.
Without this data app **will not be functional**!
