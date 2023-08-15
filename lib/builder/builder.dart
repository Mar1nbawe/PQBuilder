import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pqbuilder/WikiWidgets/WikiFoods.dart';
import 'package:pqbuilder/WikiWidgets/WikiMonsters.dart';
import '../PlayerStats.dart';
import 'package:pqbuilder/app.dart';
import 'package:pqbuilder/items.dart' as items;
import 'package:pqbuilder/Equipmentfuncs.dart';
import 'package:pqbuilder/Equipment.dart';
import '../items.dart';
import 'package:pqbuilder/wikiparsers.dart';
import 'package:pqbuilder/main.dart' as main;
import "package:hive/hive.dart";

final logic = BuilderLogic();

class BuilderLogic with ChangeNotifier {
  int buttonvaluevis = 1;
  bool detailedvisible = true;
  Widget detailedsaver = SizedBox();
  List<Widget> tobeReturned = [];
  String NameFilter = '';
  var old_filter_stats = '18';
  var old_element_stats = '4';
  var statsnamebuilder = '';
  var elementnamebuilder = '';
  bool shown = true;
  Widget widgetsaver = SizedBox();
  MasteryPaths character1 = MasteryPaths();

  /*  List<String> buildnames = [
    "Build 1",
    "Build 2",
    "Build 3",
    "Build 4",
    "Build 5"
  ]; */

  /*  List<WidgetClickables> builderwidgets =
      List.generate(84, (index) => WidgetClickables()); */

  List<String> ControllerValues = List.filled(12, "");
  List<String> AffinityValues = List.filled(4, "");
  var Saver = List.generate(7, (i) => Equipment(), growable: false);

  ShowWidgetOnTop(Widget widget) {
    shown = true;

    widgetsaver = widget;
    notifyListeners();
    return widgetsaver;
  }

  showDetailedInfo(Widget widget) {
    detailedvisible = true;

    detailedsaver = widget;

    notifyListeners();
    return detailedsaver;
  }

  setMastery(int path, newValue) {
    character1.Path[path] = newValue;

    Character.Stats[0] = character1.getAttack().floorToDouble();
    Character.Stats[1] = character1.getDefense();
    Character.Stats[2] = character1.getHP();
    Character.Stats[3] = character1.getCritChance();
    Character.Stats[4] = character1.getCritPower();
    Character.Stats[5] = character1.getMagic().floorToDouble();
    Character.Stats[6] = character1.getMDefense();
    Character.Stats[7] = character1.getHeals();
    Character.Stats[8] = character1.getEvasion();
    Character.Stats[9] = character1.getAgility();
    Character.Stats[10] = character1.getEarthP();
    Character.Stats[11] = character1.getWaterP();
    Character.Stats[12] = character1.getAirP();
    Character.Stats[13] = character1.getFireP();
    Character.Stats[14] = character1.getEarthD();
    Character.Stats[15] = character1.getWaterD();
    Character.Stats[16] = character1.getAirD();
    Character.Stats[17] = character1.getFireD();

    Passives();
    notifyListeners();
  }

  changevisdetailed() {
    detailedvisible = false;
    notifyListeners();
  }

  setAffinity(int path, newValue) {
    character1.Affinity[path] = newValue;
    Character.Stats[0] = character1.getAttack().floorToDouble();
    Character.Stats[1] = character1.getDefense();
    Character.Stats[2] = character1.getHP();
    Character.Stats[3] = character1.getCritChance();
    Character.Stats[4] = character1.getCritPower();
    Character.Stats[5] = character1.getMagic().floorToDouble();
    Character.Stats[6] = character1.getMDefense();
    Character.Stats[7] = character1.getHeals();
    Character.Stats[8] = character1.getEvasion();
    Character.Stats[9] = character1.getAgility();
    Character.Stats[10] = character1.getEarthP();
    Character.Stats[11] = character1.getWaterP();
    Character.Stats[12] = character1.getAirP();
    Character.Stats[13] = character1.getFireP();
    Character.Stats[14] = character1.getEarthD();
    Character.Stats[15] = character1.getWaterD();
    Character.Stats[16] = character1.getAirD();
    Character.Stats[17] = character1.getFireD();

    print(character1.AffinityNames);
    print(character1.Affinity);

    Passives();
    notifyListeners();
  }

  setitems() {
    Character.Stats[0] = character1.getAttack().floorToDouble();
    Character.Stats[1] = character1.getDefense();
    Character.Stats[2] = character1.getHP();
    Character.Stats[3] = character1.getCritChance();
    Character.Stats[4] = character1.getCritPower();
    Character.Stats[5] = character1.getMagic().floorToDouble();
    Character.Stats[6] = character1.getMDefense();
    Character.Stats[7] = character1.getHeals();
    Character.Stats[8] = character1.getEvasion();
    Character.Stats[9] = character1.getAgility();
    Character.Stats[10] = character1.getEarthP();
    Character.Stats[11] = character1.getWaterP();
    Character.Stats[12] = character1.getAirP();
    Character.Stats[13] = character1.getFireP();
    Character.Stats[14] = character1.getEarthD();
    Character.Stats[15] = character1.getWaterD();
    Character.Stats[16] = character1.getAirD();
    Character.Stats[17] = character1.getFireD();

    Passives();
    ElementalWeapon();
    notifyListeners();
  }

  VisibilityShown() {
    shown = !shown;
    notifyListeners();
  }

  Passives() {
    Character.Stats[0] = Character.Stats[0] +
        ((character1.Path[0] >= 75) ? 50 : 0) +
        ((character1.Path[4] >= 25) ? 70 : 0) +
        ((character1.Path[4] >= 75) ? 50 : 0) +
        ((character1.Path[7] >= 25) ? 25 : 0);

    Character.Stats[1] = Character.Stats[1] +
        ((character1.Path[0] >= 75) ? 40 : 0) +
        ((character1.Path[11] >= 25) ? 35 : 0);
    Character.Stats[2] = Character.Stats[2] +
        ((character1.Path[0] >= 25) ? 100 : 0) +
        ((character1.Path[11] >= 25) ? 70 : 0);
    Character.Stats[3] = Character.Stats[3] +
        ((character1.Path[4] >= 50) ? 200 : 0) +
        ((character1.Path[7] >= 25) ? 65 : 0);
    Character.Stats[5] = Character.Stats[5] +
        ((character1.Path[8] >= 75) ? 50 : 0) +
        ((character1.Path[7] >= 25) ? 25 : 0);
    Character.Stats[6] = Character.Stats[6] +
        ((character1.Path[8] >= 75) ? 40 : 0) +
        ((character1.Path[11] >= 25) ? 35 : 0);
    Character.Stats[7] = Character.Stats[7] +
        ((character1.Path[8] >= 25) ? 85 : 0) +
        ((character1.Path[7] >= 25) ? 30 : 0);
    Character.Stats[8] =
        Character.Stats[8] + ((character1.Path[3] >= 25) ? 70 : 0);
    Character.Stats[9] =
        Character.Stats[9] + ((character1.Path[4] >= 75) ? 20 : 0);

    Character.Stats[14] =
        Character.Stats[14] + ((character1.Path[0] >= 50) ? 7 : 0);
    Character.Stats[15] =
        Character.Stats[15] + ((character1.Path[0] >= 50) ? 7 : 0);
    Character.Stats[16] =
        Character.Stats[16] + ((character1.Path[0] >= 50) ? 7 : 0);
    Character.Stats[17] =
        Character.Stats[17] + ((character1.Path[0] >= 50) ? 7 : 0);

    Character.Stats[10] =
        Character.Stats[10] + ((character1.Path[8] >= 50) ? 7 : 0);

    Character.Stats[11] =
        Character.Stats[11] + ((character1.Path[8] >= 50) ? 7 : 0);
    Character.Stats[12] =
        Character.Stats[12] + ((character1.Path[8] >= 50) ? 7 : 0);
    Character.Stats[13] =
        Character.Stats[13] + ((character1.Path[8] >= 50) ? 7 : 0);

    if (character1.Path[8] >= 15 &&
        (character1.Path[0] >= 15 || character1.Path[4] >= 15)) {
      print(Character.Stats);
      MixedPassiveAtk();
      MixedPassiveMag();
    }

    notifyListeners();
  }

  AddItems(Equipment item) {
    Saver[item.Category] = item;

    setitems();
    notifyListeners();
  }

  MixedPassiveAtk() {
    var baseatk = character1.getAttack().floorToDouble() +
        ((character1.Path[0] >= 75) ? 50 : 0) +
        ((character1.Path[4] >= 25) ? 70 : 0) +
        ((character1.Path[4] >= 75) ? 50 : 0) +
        ((character1.Path[7] >= 25) ? 25 : 0);
    var basemag = character1.getMagic().floorToDouble() +
        ((character1.Path[8] >= 75) ? 50 : 0) +
        ((character1.Path[7] >= 25) ? 25 : 0);

    if (character1.Path[8] >= 15 &&
        (character1.Path[0] >= 15 || character1.Path[4] >= 15)) {
      if (baseatk >= 0.5 * basemag && basemag >= 0.5 * baseatk) {
        if (baseatk > basemag) {
          Character.Stats[0] =
              (((basemag / baseatk) * 0.65) * basemag) + baseatk;
        } else if (basemag > baseatk) {
          Character.Stats[0] =
              (((baseatk / basemag) * 0.65) * baseatk) + baseatk;
        } else if (basemag == baseatk) {
          Character.Stats[0] =
              (((basemag / baseatk) * 0.65) * basemag) + baseatk;
          Character.Stats[5] = Character.Stats[0];
        }
      }
    }
    notifyListeners();
  }

  MixedPassiveMag() {
    var baseatk = character1.getAttack().floorToDouble() +
        ((character1.Path[0] >= 75) ? 50 : 0) +
        ((character1.Path[4] >= 25) ? 70 : 0) +
        ((character1.Path[4] >= 75) ? 50 : 0) +
        ((character1.Path[7] >= 25) ? 25 : 0);
    var basemag = character1.getMagic().floorToDouble() +
        ((character1.Path[8] >= 75) ? 50 : 0) +
        ((character1.Path[7] >= 25) ? 25 : 0);

    if (character1.Path[8] >= 15 &&
        (character1.Path[0] >= 15 || character1.Path[4] >= 15)) {
      if (baseatk >= 0.5 * basemag && basemag >= 0.5 * baseatk) {
        if (baseatk < basemag) {
          Character.Stats[5] =
              (((baseatk / basemag) * 0.65) * baseatk) + basemag;
        } else if (basemag < baseatk) {
          Character.Stats[5] =
              (((basemag / baseatk) * 0.65) * baseatk) + basemag;
        } else if (Character.Stats[5] == Character.Stats[0]) {}
      }
    }
    notifyListeners();
  }

  ElementalWeapon() {
    int multi = 0;
    for (int i = 1; i < 7; i++) {
      if (Saver[i].Element == Saver[0].Element) {
        multi++;
        switch (Saver[i].Element) {
          case 1:
            Character.Stats[13] = Character.Stats[13] + 4;
            break;
          case 2:
            Character.Stats[11] = Character.Stats[11] + 4;
            break;
          case 3:
            Character.Stats[10] = Character.Stats[10] + 4;
            break;
          case 4:
            Character.Stats[12] = Character.Stats[12] + 4;
            break;
        }
      }
    }

    notifyListeners();
  }

  double Iterate(int j) {
    double numberer = 0;
    for (int i = 0; i < Saver.length; i++) {
      Saver[i].stats.forEach((element) {
        if (element.statNumber == j) numberer += (element.statValue);
      });
    }
    return numberer;
  }

  Decoder() async {
    String data = await rootBundle.loadString('assets/data.json');
    final jsonResult = json.decode(data);
    final rootresult = Root.fromJson(jsonResult);
    return rootresult;
  }

  List<Widget> WikiWidget(BuildContext context, int counter) {
    if (counter == 1)
      tobeReturned = MonsterWidget(context, main.monsterDatabase);
    else if (counter == 2)
      tobeReturned = FoodWidget(context, main.foodDatabase);

    print(tobeReturned.length);
    return tobeReturned;
  }
}
