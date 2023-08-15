import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Equipment.dart';
import 'app.dart';
import "items.dart";
import "builder/builder.dart" as builder;
import "dart:convert";
import 'Equipmentfuncs.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'wikiparsers.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

List<Widget> monsters = [];
List<Widget> foods = [];

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

List<Foods> foodDatabase = [];
List<Monsters> monsterDatabase = [];
List<List<Equipment>> SortedItems = new List.generate(7, (i) => [Equipment()]);

Future<String> getJsonfromFirebaseAPI(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();
  var buildHiveBox = await Hive.openBox("builds");
  runApp(MyApp(database: buildHiveBox));
  var hiveJsonBox = await Hive.openBox("jsons");

  late List<Equipment> Database;

  final connectivityResult = await (Connectivity().checkConnectivity());

  print(
      "======================================== \n CONNECTIVITY RESULT: ${connectivityResult.toString()} \n =================================================");
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    final restapifoods = await getJsonfromFirebaseAPI(
        "https://test-fa435-default-rtdb.europe-west1.firebasedatabase.app/Foods.json");

    final restapimonsters = await getJsonfromFirebaseAPI(
        "https://test-fa435-default-rtdb.europe-west1.firebasedatabase.app/Monsters/Monsters.json");

    final restapiitems = await getJsonfromFirebaseAPI(
        'https://test-fa435-default-rtdb.europe-west1.firebasedatabase.app/a/Sheet1.json');

    hiveJsonBox.put("items", restapiitems);
    hiveJsonBox.put("foods", restapifoods);
    hiveJsonBox.put("monsters", restapimonsters);
  } else if (hiveJsonBox.isEmpty) {
    final resulter = builder.logic.Decoder();
    Root maker = await resulter;
    hiveJsonBox.put("items", converterlocal(maker));
  } else
    ;

  final jsonresponse = jsonDecode(hiveJsonBox.get("items"));
  final response = jsonDecode(hiveJsonBox.get("foods"));
  final mobresponse = jsonDecode(hiveJsonBox.get("monsters"));

  List<JsonMonsters> makerMonsters = [];
  List<JsonFoods> makerFoods = [];

  for (Map<String, dynamic> i in mobresponse)
    makerMonsters.add(JsonMonsters.fromJson(i));
  for (Map<String, dynamic> i in response)
    makerFoods.add(JsonFoods.fromJson(i));

  monsterDatabase = convertMonsters(makerMonsters);

  foodDatabase = convertFood(makerFoods);

  List<Items> maker = [];

  for (Map<String, dynamic> i in jsonresponse) maker.add(Items.fromJson(i));
  Database = converter(maker);

  for (int i = 0; i < 7; i++) {
    SortedItems[i] = Sorter(Database, i);
  }

  print(foodDatabase.length);
  print(monsterDatabase.length);
}

class MyApp extends StatefulWidget {
  MyApp({super.key, this.database});
  Box<dynamic>? database;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UniqueKey builderKey = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => builder.BuilderLogic())
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Grenze'),
        navigatorKey: navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => BuilderApp(key: builderKey),
        },
      ),
    );
  }
}
