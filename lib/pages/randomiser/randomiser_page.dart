/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/common/constants.dart';
import 'package:eldritch_companion/pages/randomiser/randomiser_modal_bottom.dart';
import 'package:eldritch_companion/types/cards/investigator.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:eldritch_companion/models/game_data_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RandomiserPage extends StatefulWidget {
  const RandomiserPage({super.key});

  @override
  State<StatefulWidget> createState() => _RandomiserPageState();
}

class _RandomiserPageState extends State<RandomiserPage> {
  int cardsToGenerate = 1;
  bool duplicateCards = false;

  bool conditionMultichoice = false;
  bool spellMultichoice = false;
  bool uniqueAssetMultichoice = false;
  bool investigatorMultichoice = false;

  late GameDataModel gameDataModel;

  static const rowPadding = SizedBox(width: 8);
  static const columnPadding = SizedBox(height: 8);

  static const double randomiserControlHeight = 80;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    gameDataModel = Provider.of<GameDataModel>(context);
  }

  void showRandomCards(Type cardType) {
    showMaterialModalBottomSheet(
        expand: false,
        context: context,
        shape: defaultRoundedRectangleTop,
        builder: (context) => RandomiserModalBottom(
              gameDataModel: gameDataModel,
              cardCount: cardsToGenerate,
              cardType: cardType,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Condition
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Conditions
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(defaultCircularRadius)),
                      shadows: [subtleShadow]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(conditionColor)),
                        onPressed: () {},
                        child: const Text(
                          'Condition',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      columnPadding,
                      // Table
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Bane'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Boon'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Deal'),
                                ),
                              ),
                            ],
                          ),
                          columnPadding,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Exposure'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Illness'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Injury'),
                                ),
                              ),
                            ],
                          ),
                          columnPadding,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Madness'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Pursuit'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Restriction'),
                                ),
                              ),
                            ],
                          ),
                          columnPadding,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Talent'),
                                ),
                              ),
                              rowPadding,
                              Expanded(child: Container()),
                              rowPadding,
                              Expanded(child: Container()),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Multichoice'),
                          Switch(
                              value: conditionMultichoice,
                              onChanged: (value) =>
                                  setState(() => conditionMultichoice = value))
                        ],
                      )
                    ],
                  ),
                ),
                columnPadding,
                // Spells
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(defaultCircularRadius)),
                      shadows: [subtleShadow]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(spellColor)),
                        onPressed: () {},
                        child: const Text(
                          'Spell',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      columnPadding,
                      // Table
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Incantation'),
                            ),
                          ),
                          rowPadding,
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Ritual'),
                            ),
                          ),
                          rowPadding,
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Glamour'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Multichoice'),
                          Switch(
                              value: spellMultichoice,
                              onChanged: (value) =>
                                  setState(() => spellMultichoice = value))
                        ],
                      )
                    ],
                  ),
                ),
                columnPadding,
                // Unique asset
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(defaultCircularRadius)),
                      shadows: [subtleShadow]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(uniqueAssetColor)),
                        onPressed: () {},
                        child: const Text(
                          'Unique asset',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      columnPadding,
                      // Table
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Ally'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Character'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Relic'),
                                ),
                              ),
                            ],
                          ),
                          columnPadding,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Item'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Trinket'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Magical'),
                                ),
                              ),
                            ],
                          ),
                          columnPadding,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Tome'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Weapon'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Task'),
                                ),
                              ),
                            ],
                          ),
                          columnPadding,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Tarot'),
                                ),
                              ),
                              rowPadding,
                              Expanded(child: Container()),
                              rowPadding,
                              Expanded(child: Container()),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Multichoice'),
                          Switch(
                              value: uniqueAssetMultichoice,
                              onChanged: (value) => setState(
                                  () => uniqueAssetMultichoice = value))
                        ],
                      )
                    ],
                  ),
                ),
                columnPadding,
                // Investigator
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(defaultCircularRadius)),
                      shadows: [subtleShadow]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(investigatorColor)),
                        onPressed: () => showRandomCards(Investigator),
                        child: const Text(
                          'Investigator',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      columnPadding,
                      // Table
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Magic'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Combat'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Research'),
                                ),
                              ),
                            ],
                          ),
                          columnPadding,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Expedition'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Gate closer'),
                                ),
                              ),
                              rowPadding,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Support'),
                                ),
                              ),
                            ],
                          ),
                          columnPadding,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('All-rounder'),
                                ),
                              ),
                              rowPadding,
                              Expanded(child: Container()),
                              rowPadding,
                              Expanded(child: Container()),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Multichoice'),
                          Switch(
                              value: investigatorMultichoice,
                              onChanged: (value) => setState(
                                  () => investigatorMultichoice = value))
                        ],
                      )
                    ],
                  ),
                ),
                // padding
                columnPadding,
                Container(height: randomiserControlHeight)
              ],
            )
          ],
        ),
        // Randomiser controls
        Column(
          children: [
            Expanded(child: Container()),
            Container(
              decoration: const ShapeDecoration(
                  color: Colors.amber,
                  shape: defaultRoundedRectangleTop,
                  shadows: [subtleShadow]),
              height: randomiserControlHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Cards'),
                          NumberPicker(
                              axis: Axis.horizontal,
                              itemWidth: 50,
                              minValue: 1,
                              maxValue: 20,
                              value: cardsToGenerate,
                              onChanged: (value) =>
                                  setState(() => cardsToGenerate = value))
                        ]),
                  ),
                  const VerticalDivider(
                    color: Colors.black54,
                    thickness: 0.5,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Allow duplicates'),
                      Checkbox(
                          value: duplicateCards,
                          onChanged: (value) {
                            setState(() => duplicateCards = value ?? false);
                          }),
                    ],
                  )),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
