import 'equipstats.dart';

class Equipment {
  String name = "Unknown Name";
  int Element = 0;
  int Category = 0;
  /* 
  0 - weapon
  1 - accessory
  2 - helmet
  3 - armor
  4 - belt
  5 - legs
  6 - off-hand
   */
  int Floor = 0;
  List<EquipStats> stats = List.generate(18, (index) => EquipStats());
}
