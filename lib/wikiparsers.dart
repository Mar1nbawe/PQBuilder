import 'package:flutter/material.dart';

import 'EquipStats.dart';

var attackplaceholder;
var weaknessplaceholder;
var resistanceplaceholder;
var dropplaceholder;

class JsonFoods {
  String name = "Unknown Item";
  String gradient = "0";
  String resource1 = "N/A";
  String resource2 = "N/A";
  String resource3 = "N/A";
  String atk = "0";
  String def = "0";
  String hP = "0";
  String critC = "0";
  String critP = "0";
  String mag = "0";
  String mdef = "0";
  String heal = "0";
  String eva = "0";
  String agl = "0";
  String earthP = "0";
  String waterP = "0";
  String airP = "0";
  String fireP = "0";
  String earthR = "0";
  String waterR = "0";
  String airR = "0";
  String fireR = "0";

  JsonFoods(
    String key, {
    this.name = "Unknown Name",
    this.gradient = "0",
    this.resource1 = "N/A",
    this.resource2 = "N/A",
    this.resource3 = "N/A",
    this.atk = "0",
    this.def = "0",
    this.hP = "0",
    this.critC = "0",
    this.critP = "0",
    this.mag = "0",
    this.mdef = "0",
    this.heal = "0",
    this.eva = "0",
    this.agl = "0",
    this.earthP = "0",
    this.waterP = "0",
    this.airP = "0",
    this.fireP = "0",
    this.earthR = "0",
    this.waterR = "0",
    this.airR = "0",
    this.fireR = "0",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['Resource 1'] = resource1;
    data['Resource 2'] = resource2;
    data['Resource 3'] = resource3;
    data['Gradient'] = gradient;
    data['Atk'] = hP;
    data['Def'] = atk;
    data['HP'] = def;
    data['Crit C'] = mdef;
    data['Crit P'] = mag;
    data['Mag'] = critC;
    data['Mdef'] = critP;
    data['Heal'] = agl;
    data['Eva'] = eva;
    data['Agl'] = heal;
    data['Earth P'] = earthP;
    data['Water P'] = waterP;
    data['Fire P'] = fireP;
    data['Air P'] = airP;
    data['Earth R'] = earthR;
    data['Water R'] = waterR;
    data['Fire R'] = fireR;
    data['Air R'] = airR;
    return data;
  }

  JsonFoods.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['Name'] ?? "Unknown Name";
    gradient = parsedJson['Gradient'] ?? "0";
    resource1 = parsedJson['Resource 1'] ?? "N/A";
    resource2 = parsedJson['Resource 2'] ?? "N/A";
    resource3 = parsedJson['Resource 3'] ?? "N/A";
    atk = parsedJson['Atk'] ?? "0";
    def = parsedJson['Def'] ?? "0";
    hP = parsedJson['HP'] ?? "0";
    critC = parsedJson['Crit C'] ?? "0";
    critP = parsedJson['Crit P'] ?? "0";
    mag = parsedJson['Mag'] ?? "0";
    mdef = parsedJson['Mdef'] ?? "0";
    heal = parsedJson['Heal'] ?? "0";
    eva = parsedJson['Eva'] ?? "0";
    agl = parsedJson['Agl'] ?? "0";
    earthP = parsedJson['Earth P'] ?? "0";
    waterP = parsedJson['Water P'] ?? "0";
    fireP = parsedJson['Fire P'] ?? "0";
    airP = parsedJson['Air P'] ?? "0";
    earthR = parsedJson['Earth R'] ?? "0";
    waterR = parsedJson['Water R'] ?? "0";
    fireR = parsedJson['Fire R'] ?? "0";
    airR = parsedJson['Air R'] ?? "0";
  }
}

List<Foods> convertFood(List<JsonFoods> value) {
  List<Foods> foodpog = List.generate(value.length, (index) => Foods());

  int i = 0;

  value.forEach((element) {
    int j = 0;
    foodpog[i].name = element.name;
    foodpog[i].gradient = int.parse(element.gradient);
    foodpog[i].resource[0] = element.resource1;
    foodpog[i].resource[1] = element.resource2;
    foodpog[i].resource[2] = element.resource3;

    element.toJson().forEach((key, value) {
      if (key == "Name" ||
          key == "Element" ||
          key == "Gradient" ||
          key == "Resource 1" ||
          key == "Resource 2" ||
          key == "Resource 3")
        ;
      else {
        foodpog[i].stats[j].statValue = int.parse(value);
        foodpog[i].stats[j].statNumber = j;
        j++;
      }
    });
    i++;
  });

  return foodpog;
}

class Foods {
  String name = "Unknown Name";
  List<String> resource = List.generate(3, (index) => "N/A");
  int gradient = 0;

  List<EquipStats> stats = List.generate(18, (index) => EquipStats());
}

class JsonMonsters {
  String name = "Unknown Name";
  String floor = "F1";
  String dungeon = 'D1';
  String damage = '0';
  String sustain = '0';
  String debuff = '0';
  String isboss = '0';
  List<String> attack = ['-'];
  List<String> weakness = ['-'];
  List<String> resistance = ['-'];
  List<String> drop = ['-'];

  JsonMonsters(
    String key, {
    this.name = 'Unknown Name',
    this.floor = "F1",
    this.dungeon = 'D1',
    this.damage = '0',
    this.sustain = '0',
    this.debuff = '0',
    this.isboss = '0',
    required this.attack,
    required this.weakness,
    required this.resistance,
    required this.drop,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['Floor'] = floor;
    data['Dungeon'] = dungeon;
    data['Damage'] = damage;
    data['Sustain'] = sustain;
    data['Debuff'] = debuff;
    data['IsBoss'] = isboss;
    data['Attack'] = attack;
    data['Weakness'] = weakness;
    data['Resistance'] = resistance;
    data['Drop'] = drop;
    return data;
  }

  JsonMonsters.fromJson(Map<String, dynamic> parsedJson) {
    var attackplaceholder = parsedJson['Attack'] ?? '-';
    var weaknessplaceholder = parsedJson['Weakness'] ?? '-';
    var resistanceplaceholder = parsedJson['Resistance'] ?? '-';
    var dropplaceholder = parsedJson['Drop'] ?? '-';

    name = parsedJson['Name'] ?? "Unknown Name";
    floor = parsedJson['Floor'] ?? "F1";
    dungeon = parsedJson['Dungeon'] ?? "D1";
    damage = parsedJson['Damage'] ?? "0";
    sustain = parsedJson['Sustain'] ?? "0";
    debuff = parsedJson['Debuff'] ?? "0";
    isboss = parsedJson['IsBoss'] ?? "0";
    attack = attackplaceholder.toString().split(",");
    weakness = weaknessplaceholder.toString().split(",");
    resistance = resistanceplaceholder.toString().split(",");
    drop = dropplaceholder.toString().split(",");
  }
}

List<Monsters> convertMonsters(List<JsonMonsters> value) {
  List<Monsters> pogMonsters =
      List.generate(value.length, (index) => Monsters());
  int i = 0;
  value.forEach((element) {
    pogMonsters[i].name = element.name;
    pogMonsters[i].floor = int.parse(element.floor.substring(1));
    pogMonsters[i].dungeon = int.parse(element.dungeon.substring(1));
    pogMonsters[i].damage = int.parse(element.damage);
    pogMonsters[i].sustain = int.parse(element.sustain);
    pogMonsters[i].debuff = int.parse(element.debuff);

    if (element.isboss == '0')
      pogMonsters[i].isboss = false;
    else
      pogMonsters[i].isboss = true;

    pogMonsters[i].attack = element.attack;
    pogMonsters[i].weakness = element.weakness;
    pogMonsters[i].resistance = element.resistance;
    pogMonsters[i].drop = element.drop;
    i++;
  });

  return pogMonsters;
}

class Monsters {
  String name = "Unknown Name";
  int floor = 0;
  int dungeon = 0;
  int damage = 0;
  int sustain = 0;
  int debuff = 0;
  bool isboss = false;
  List<String> attack = ['-'];
  List<String> weakness = ['-'];
  List<String> resistance = ['-'];
  List<String> drop = ['-'];
}

/* class WidgetClickables {
  Widget widgets = SizedBox();
  String widgetname = 'Unknown Name';
} */
