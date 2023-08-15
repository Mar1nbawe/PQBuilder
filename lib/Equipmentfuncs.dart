import "items.dart";
import 'Equipment.dart';

//Items value
List<Equipment> converter(List<Items> value) {
  List<Equipment> converted =
      List.generate(value.length, (index) => Equipment()); //value.length
  int i = 0;
  value.forEach((e) {
    int j = 0;
    //print(i);
    // converted[i].Floor = (e.floor == "GD") ? 9 : int.tryParse(e.floor.substring(1));
    if (e.floor == "GD")
      converted[i].Floor = 9;
    else
      converted[i].Floor = int.parse(e.floor.substring(1));
    //print(converted[i].Floor);
    e.toJson().forEach((key, value) {
      if (key == "Name" ||
          key == "Element" ||
          key == "Category" ||
          key == "Floor")
        ;
      else {
        // print("$key: $value");
        converted[i].stats[j].statValue = int.parse(value);
        converted[i].stats[j].statNumber = j;
        j++;
      }
    });
    converted[i].name = e.name;
    switch (e.color) {
      case ("Red"):
        converted[i].Element = 1;
        break;
      case ("Blue"):
        converted[i].Element = 2;
        break;
      case ("Green"):
        converted[i].Element = 3;
        break;
      case ("Yellow"):
        converted[i].Element = 4;
        break;
    }
    switch (e.category) {
      case "Weapons":
        converted[i].Category = 0;
        break;
      case "Accessory":
        converted[i].Category = 1;
        break;
      case "Hat":
        converted[i].Category = 2;
        break;
      case "Armor":
        converted[i].Category = 3;
        break;
      case "Belt":
        converted[i].Category = 4;
        break;
      case "Shoes":
        converted[i].Category = 5;
        break;
      case "Off-Hand":
        converted[i].Category = 6;
        break;
    }
    i++;
  });

  return converted;
}

List<Equipment> Sorter(List<Equipment> Database, int category) {
  List<Equipment> converted = List.filled(100, Equipment(), growable: true);
  int i = 0;
  Database.forEach((element) {
    if (element.Category == category) {
      converted[i] = element;
      i++;
    }
  });
  converted.removeWhere((element) => element.name == "Unknown Name");

  return converted;
}

List<Equipment> converterlocal(Root value) {
  List<Equipment> converted = List.generate(
      value.sheet1!.length, (index) => Equipment()); //value.length
  int i = 0;
  value.sheet1!.forEach((e) {
    int j = 0;
    //print(i);
    // converted[i].Floor = (e.floor == "GD") ? 9 : int.tryParse(e.floor.substring(1));
    if (e.floor == "GD")
      converted[i].Floor = 9;
    else
      converted[i].Floor = int.parse(e.floor.substring(1));
    //print(converted[i].Floor);
    e.toJson().forEach((key, value) {
      if (key == "Name" ||
          key == "Element" ||
          key == "Category" ||
          key == "Floor")
        ;
      else {
        // print("$key: $value");
        converted[i].stats[j].statValue = int.parse(value);
        converted[i].stats[j].statNumber = j;
        j++;
      }
    });
    converted[i].name = e.name;
    switch (e.color) {
      case ("Red"):
        converted[i].Element = 1;
        break;
      case ("Blue"):
        converted[i].Element = 2;
        break;
      case ("Green"):
        converted[i].Element = 3;
        break;
      case ("Yellow"):
        converted[i].Element = 4;
        break;
    }
    switch (e.category) {
      case "Weapons":
        converted[i].Category = 0;
        break;
      case "Accessory":
        converted[i].Category = 1;
        break;
      case "Hat":
        converted[i].Category = 2;
        break;
      case "Armor":
        converted[i].Category = 3;
        break;
      case "Belt":
        converted[i].Category = 4;
        break;
      case "Shoes":
        converted[i].Category = 5;
        break;
      case "Off-Hand":
        converted[i].Category = 6;
        break;
    }
    i++;
  });

  return converted;
}
