/* Eldritch Companion, an assitant app for Eldritch Horror
Copyright (C) 2024 Roman Zubin

Full notice can be found at /lib/main.dart file. */

import 'package:eldritch_companion/common/constants.dart';
import 'package:eldritch_companion/pages/randomiser/randomiser_modal_bottom.dart';
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

  late GameDataModel gameDataModel;

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
                              BorderRadius.all(defaultCircularRadius))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: const Text('Condition'),
                      ),
                      // Table
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Bane'),
                                ),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Boon'),
                                ),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Deal'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Exposure'),
                                ),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Illness'),
                                ),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Injury'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Madness'),
                                ),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Pursuit'),
                                ),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Restriction'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Talent'),
                                ),
                              ),
                              Expanded(child: Container()),
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
                )
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
                  shadows: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 5)
                  ]),
              height: 80,
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
