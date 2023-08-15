import 'package:pqbuilder/app.dart';
import 'builder/builder.dart' as builder;

class StatsUser {
  List<double> Stats = List.filled(18, 0);
  List<String> StatsNames = [
    "Attack", //0
    "Def", //1
    "HP", //2
    "CChance", //3
    "CPower", //4
    "Magic", //5
    "MDef", //6
    "Heals", //7
    "Evasion", //8
    "Agility", //9
    "Earth P", //10
    "Water P", // 11
    "Air P", // 12
    "Fire P", // 13
    "Earth R", // 14
    "Water R", // 15
    "Air R", //16
    "Fire R" //17
  ];

  StatsUser() {
    // HP = 100 + level * 11;
  }
}

class MasteryPaths {
  List<double> Path = List.filled(12, 0);
  List<String> PathNames = [
    "Warrior", // 0
    "Berserker", //1
    "Warden", //2
    "Monk", //3
    "Rogue", //4
    "Assassin", //5
    "Ranger", //6
    "Bard", //7
    "Mage", //8
    "Druid", //9
    "Necro", //10
    "Guardian" //11
  ];
  List<int> Affinity = List.filled(4, 0);
  List<String> AffinityNames = ["Strength", "Will", "Endurance", "Dexterity"];
  MasteryPaths({
    Path,
    PathNames,
    Affinity,
    AffinityNames,
  });

  @override
  /* String toString() {
    return "[$rogue $warrior $mage] [$assassin $ranger] [$berserker $warden] [$druid $necromancer]";
  } */

  double getAttack() {
    return ((Path[0] + Path[4] + Path[3] + Path[7] + Path[5]) * 3) +
        ((Path[1] + Path[6] + Affinity[0]) * 4) +
        Path[11] * 2 +
        builder.logic.Iterate(0);
  }

  double getMagic() {
    return ((Path[8] + Path[7]) * 3 +
            ((Path[10] + Affinity[1]) * 4) +
            (Path[11] * 2) +
            Path[9]) +
        builder.logic.Iterate(5);
  }

  double getDefense() {
    return ((Path[0] + Path[11] + Affinity[2]) * 2 + Path[2] * 4 + Path[3]) +
        builder.logic.Iterate(1);
  }

  double getMDefense() {
    return ((Path[8] + Path[11] + Affinity[2]) * 2 + Path[9] * 4 + Path[10]) +
        builder.logic.Iterate(6);
  }

  double getHP() {
    return (1200 + Path[0] + Path[1] + Path[11] + Path[2] * 2) +
        builder.logic.Iterate(2);
  }

  double getHeals() {
    return (Path[8] + Path[7] + (Path[9] + Affinity[2]) * 2) +
        builder.logic.Iterate(7);
  }

  double getCritChance() {
    return (Path[4] * 3 +
            (Path[3] + Path[10]) * 2 +
            Path[7] +
            (Path[5] + Affinity[3]) * 4) +
        builder.logic.Iterate(3);
  }

  double getCritPower() {
    return 0 + builder.logic.Iterate(4);
  }

  double getEvasion() {
    return (Path[3] + Path[1] + Path[6] + Affinity[3] * 2) +
        builder.logic.Iterate(8);
  }

  double getAgility() {
    return (Path[4] + Path[7] + Path[6] + Affinity[3]) +
        builder.logic.Iterate(9);
  }

  double getWaterP() {
    return builder.logic.Iterate(11);
  }

  double getFireP() {
    return builder.logic.Iterate(13);
  }

  double getEarthP() {
    return builder.logic.Iterate(10);
  }

  double getAirP() {
    return builder.logic.Iterate(12);
  }

  double getWaterD() {
    return builder.logic.Iterate(15);
  }

  double getFireD() {
    return builder.logic.Iterate(17);
  }

  double getEarthD() {
    return builder.logic.Iterate(14);
  }

  double getAirD() {
    return builder.logic.Iterate(16);
  }
}
