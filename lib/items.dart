/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Root {
  List<Sheet1>? sheet1;

  Root({this.sheet1});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['Sheet1'] != null) {
      sheet1 = <Sheet1>[];
      json['Sheet1'].forEach((v) {
        sheet1!.add(Sheet1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(bool contains) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Sheet1'] =
        Sheet1 != null ? sheet1!.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class Sheet1 {
  String name = "Unknown Item";
  String color = "neutral";
  String category = "Item";
  String floor = "F1";
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

  Sheet1(
    String key, {
    this.name = "Unknown Name",
    this.color = "red",
    this.category = "F1",
    this.floor = "0",
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

  Sheet1.fromJson(Map<String, dynamic> json) {
    name = json['Name'] ?? "Unknown Name";
    color = json['Color'] ?? "Red";
    category = json['Category'] ?? "Category";
    floor = json['Floor'] ?? "F8";
    atk = json['Atk'] ?? "0";
    critC = json['Crit C'] ?? "0";
    critP = json['Crit P'] ?? "0";
    airP = json['Air P'] ?? "0";
    def = json['Def'] ?? "0";
    eva = json['Eva'] ?? "0";
    waterP = json['HP'] ?? "0";
    mag = json['Mag'] ?? "0";
    heal = json['Heal'] ?? "0";
    waterR = json['Water R'] ?? "0";
    earthP = json['Earth P'] ?? "0";
    mdef = json['Mdef'] ?? "0";
    fireR = json['Fire r'] ?? "0";
    fireP = json['Fire P'] ?? "0";
    earthR = json['Earth R'] ?? "0";
    agl = json['Agl'] ?? "0";
    airR = json['Air R'] ?? "0";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['Element'] = color;
    data['Category'] = category;
    data['Floor'] = floor;
    data['Atk'] = atk;
    data['Def'] = def;
    data['HP'] = hP;
    data['Crit C'] = critC;
    data['Crit P'] = critP;
    data['Mag'] = mag;
    data['Mdef'] = mdef;
    data['Heal'] = heal;
    data['Eva'] = eva;
    data['Agl'] = agl;
    data['Earth P'] = earthP;
    data['Water P'] = waterP;
    data['Air P'] = airP;
    data['Fire P'] = fireP;
    data['Earth R'] = earthR;
    data['Water R'] = waterR;
    data['Air R'] = airR;
    data['Fire R'] = fireR;
    return data;
  }
}

class Items {
  String name = "Unknown Item";
  String color = "neutral";
  String category = "Item";
  String floor = "F1";
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

  Items(
    String key, {
    this.name = "Unknown Name",
    this.color = "red",
    this.category = "F1",
    this.floor = "0",
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

  Items.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['Name'] ?? "Unknown Name";
    color = parsedJson['Color'] ?? "Red";
    category = parsedJson['Category'] ?? "Category";
    floor = parsedJson['Floor'] ?? "F8";
    atk = parsedJson['Atk'] ?? "0";
    critC = parsedJson['Crit C'] ?? "0";
    critP = parsedJson['Crit P'] ?? "0";
    airP = parsedJson['Air P'] ?? "0";
    def = parsedJson['Def'] ?? "0";
    eva = parsedJson['Eva'] ?? "0";
    waterP = parsedJson['Water P'] ?? "0";
    hP = parsedJson['HP'] ?? "0";
    mag = parsedJson['Mag'] ?? "0";
    heal = parsedJson['Heal'] ?? "0";
    waterR = parsedJson['Water R'] ?? "0";
    earthP = parsedJson['Earth P'] ?? "0";
    mdef = parsedJson['Mdef'] ?? "0";
    fireR = parsedJson['Fire R'] ?? "0";
    fireP = parsedJson['Fire P'] ?? "0";
    earthR = parsedJson['Earth R'] ?? "0";
    agl = parsedJson['Agl'] ?? "0";
    airR = parsedJson['Air R'] ?? "0";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['Element'] = color;
    data['Category'] = category;
    data['Floor'] = floor;
    data['Atk'] = atk;
    data['Def'] = def;
    data['HP'] = hP;
    data['Crit C'] = critC;
    data['Crit P'] = critP;
    data['Mag'] = mag;
    data['Mdef'] = mdef;
    data['Heal'] = heal;
    data['Eva'] = eva;
    data['Agl'] = agl;
    data['Earth P'] = earthP;
    data['Water P'] = waterP;
    data['Air P'] = airP;
    data['Fire P'] = fireP;
    data['Earth R'] = earthR;
    data['Water R'] = waterR;
    data['Air R'] = airR;
    data['Fire R'] = fireR;
    return data;
  }
}
