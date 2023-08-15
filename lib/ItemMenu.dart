import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/grenze.dart';

import 'Equipment.dart';

import 'package:flutter/material.dart';

import "package:pqbuilder/ui/theme.dart" as ui;
import 'builder/builder.dart' as builder;

class ItemMenu extends StatefulWidget {
  ItemMenu({
    Key? key,
    required this.Lister,
    required this.Category,
  }) : super(key: key);
  List<Equipment> Lister;
  final int Category;

  String filter_stats = '18';

  String filter_statsname = "All";

  String filter_elementname = "All";

  String filter_element = '4';

  List<String> filter_statlist = [
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
    "Fire R", //17
    "All" // 18
  ];

  List<String> filter_elementlist = [
    "Fire", //0
    "Water", //1
    "Earth", //2
    "Air", //3
    "All" //4
  ];

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

void clearText(_controller) {
  _controller.clear();
}

class _ItemMenuState extends State<ItemMenu> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ui.Theme.darkDarkest,
      height: MediaQuery.of(context).size.height * 1.25,
      child: Stack(children: [
        Stack(
          children: [
            ListView(children: [
              Stack(children: [
                Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Column(children: [
                              Column(
                                  children: f(
                                      widget.Category,
                                      context,
                                      widget.Lister,
                                      builder.logic.old_filter_stats,
                                      builder.logic.old_element_stats,
                                      builder.logic.NameFilter))
                            ])
                          ],
                        )),
                  ],
                ),
              ]),
            ]),
            Align(
              alignment: Alignment(0, 1),
              child: Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration:
                    BoxDecoration(color: ui.Theme.darkDarkest.withOpacity(0.5)),
                child: Stack(children: [
                  Align(
                    alignment: Alignment(0, -1),
                    child: IconButton(
                        onPressed: () {
                          print("before: ${builder.logic.shown}");
                          //builder.logic.shown = !builder.logic.shown;
                          builder.logic.VisibilityShown();
                          print("after: ${builder.logic.shown}");
                          /* 
          
                                print(
                                    "\n THIS IS OLD FILTER STATS: ${builder.logic.old_filter_stats}");
                                print(
                                    "\n THIS IS OLD ELEMENT STATS: ${builder.logic.old_element_stats}"); */
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                        )),
                  ),
                  // filtru pentru stats-uri
                  Align(
                    alignment: Alignment(-0.9, -0.6),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.17,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: ui.Theme.darkDarkest,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromRGBO(155, 155, 155, 1))),
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: DropdownButton<String>(
                              dropdownColor: ui.Theme.darkDarkest,
                              isExpanded: true,
                              alignment: Alignment.center,
                              value: (builder.logic.statsnamebuilder == '')
                                  ? widget.filter_statsname
                                  : builder.logic.statsnamebuilder,
                              icon: Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward),
                              ),
                              items: widget.filter_statlist
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: GrenzeBorderText(
                                      text: Text(
                                    value,
                                    style: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        color: Colors.white),
                                    textAlign: TextAlign.right,
                                  )),
                                );
                              }).toList(),
                              onChanged: ((String? value) {
                                setState(() {
                                  builder.logic.statsnamebuilder = value!;

                                  builder.logic.old_filter_stats = widget
                                      .filter_statlist
                                      .indexOf(builder.logic.statsnamebuilder)
                                      .toString();

                                  print(widget.filter_stats);
                                });
                              })),
                        ),
                      ),
                    ),
                  ),
                  //filtru pentru elementul itemului
                  Align(
                    alignment: Alignment(-0.4, -0.6),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.17,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: ui.Theme.darkDarkest,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromRGBO(155, 155, 155, 1))),
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: DropdownButton<String>(
                              dropdownColor: ui.Theme.darkDarkest,
                              isExpanded: true,
                              alignment: Alignment.center,
                              value: (builder.logic.elementnamebuilder == '')
                                  ? widget.filter_elementname
                                  : builder.logic.elementnamebuilder,
                              icon: Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward),
                              ),
                              items: widget.filter_elementlist
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: GrenzeBorderText(
                                      text: Text(
                                    value,
                                    style: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        color: Colors.white),
                                    textAlign: TextAlign.right,
                                  )),
                                );
                              }).toList(),
                              onChanged: ((String? value) {
                                setState(() {
                                  builder.logic.elementnamebuilder = value!;
                                  builder.logic.old_element_stats = widget
                                      .filter_elementlist
                                      .indexOf(builder.logic.elementnamebuilder)
                                      .toString();

                                  print(widget.filter_element);
                                });
                              })),
                        ),
                      ),
                    ),
                  ),
                  // sterge filtru de nume al itemului
                  Align(
                    alignment: Alignment(1, -1),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            builder.logic.NameFilter = '';
                            _controller.clear();
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        )),
                  ),
                ]),
              ),
            ),
          ],
        ),
        // textfield care filtreaza numele itemelor
        Align(
          alignment: Alignment(0.7, 0.949),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.32,
            decoration: BoxDecoration(
                color: ui.Theme.darkDarkest,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromRGBO(155, 155, 155, 1))),
            child: TextFormField(
              cursorColor: Colors.white,
              style: GoogleFonts.grenze(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.04),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  hintText: (builder.logic.NameFilter == '')
                      ? "Name of item..."
                      : builder.logic.NameFilter,
                  hintStyle: GoogleFonts.grenze(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04)),
              controller: _controller,
              onChanged: (String value) {
                setState(() {
                  builder.logic.NameFilter = _controller.text;
                });
              },
            ),
          ),
        ),
      ]),
    );
  }
}

List<Widget> f(int category, BuildContext context, List<Equipment> Lister,
    String statFilter, String elementFilter, String filterName) {
  print("\n THIS IS statfilter: $statFilter");
  print("\n THIS IS elementfilter: $elementFilter");
  var element_Filter = elementFilter;
  var stat_Filter = statFilter;
  /* stat_Filter = statFilter;
  element_Filter = elementFilter; */

  Equipment Remover = Equipment();
  Remover.Category = category;
  List<Equipment> Filtered =
      List.generate(0, (index) => Equipment(), growable: true);
  List<Widget> widgets = [];
  List<Widget> widgetTitle = [];
  List<Widget> widgetrows = [];
  List<String> StatsNames = [
    "Atk", //0
    "Def", //1
    "HP", //2
    "C Chance", //3
    "C Power", //4
    "Mag", //5
    "MDef", //6
    "Heals", //7
    "Eva", //8
    "Agl", //9
    "Earth P", //10
    "Water P", // 11
    "Air P", // 12
    "Fire P", // 13
    "Earth R", // 14
    "Water R", // 15
    "Air R", //16
    "Fire R" //17
  ];
//&&  element.Element == 3
/*  */
  Lister.sort(
    (a, b) {
      return b.Floor.compareTo(a.Floor);
    },
  );
  Lister.where((element) =>
          element.Category == category &&
          ((element_Filter == "4")
              ? true
              : (element.Element == int.parse(element_Filter) + 1)) &&
          ((stat_Filter == '18')
              ? true
              : element.stats[int.parse(stat_Filter)].statValue > 0) &&
          ((filterName == '')
              ? true
              : element.name.toLowerCase().contains(filterName.toLowerCase())))
      .map((e) {
    {
      /////////TITLE OF ITEM

      Filtered.add(e);
      widgetTitle.add(GrenzeBorderText(
        text: Text(
          "${e.name}",
          style: GoogleFonts.grenze(
              color: ui.Theme.AffinityDark[e.Element - 1],
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold),
        ),
      ));

      ///////STATS OF ITEM
      widgets.add(GrenzeBorderText(
        text: Text(
          "${e.stats.where((element) => element.statValue != 0).map((e) => "${StatsNames[e.statNumber]} = ${e.statValue}  ").toString().replaceAll(RegExp(r"([(),])", unicode: true), '')}",
          style: GoogleFonts.grenze(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.035),
        ),
      ));
    }
  }).toString();
  /* Filtered.sort(
    (a, b) {
      return b.Floor.compareTo(a.Floor);
    },
  ); */
  for (int i = 0; i < widgets.length; i++) {
    {
      widgetrows.add(Stack(children: [
        GestureDetector(
          onTap: () {
            if (Filtered[i].name == builder.logic.Saver[category].name) {
              builder.logic.AddItems(Remover);
              builder.logic.shown = !builder.logic.shown;
            } else {
              builder.logic.AddItems(Filtered[i]);
              builder.logic.shown = !builder.logic.shown;
            }
          },
          //////ABOVE IS GESTURE DETECTOR
          ///
          ///
          //////CONTAINER WHERE U HAVE ALL THINGS
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromRGBO(25, 25, 25, 1),
                border: Border.all(
                  width: 2.5,
                  color:
                      (Filtered[i].name == builder.logic.Saver[category].name)
                          ? Colors.amber
                          : Colors.black,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Stack(children: [
              //////////// FLOOR INDICATOR
              Positioned(
                right: 0,
                child: Container(
                  width: 35,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20)),
                    color: Color.fromRGBO(55, 55, 55, 0.5),
                  ),
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: ui.Theme
                                    .FloorGradients[Filtered[i].Floor - 1],
                                tileMode: TileMode.decal)
                            .createShader(bounds);
                      },
                      child: GrenzeBorderText(
                          text: (Filtered[i].Floor != 9)
                              ? Text(
                                  "F${Filtered[i].Floor}",
                                  style: GoogleFonts.grenze(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                )
                              : Text(
                                  "GD",
                                  style: GoogleFonts.grenze(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                )),
                    ),
                  ),
                ),
              ),
              ////////// ABOVE IS FLOOR
              ///
              ///IMAGE OF ITEM
              Positioned(
                top: 15,
                left: 7.5,
                child: Image.asset(
                  "assets/equipment/${Filtered[i].name}.png",
                  filterQuality: FilterQuality.none,
                  scale: 0.35,
                ),
              ),
              /////ABOVE IS IMAGE
              ///
              /// TITLES AND STATS
              Positioned(
                  /* top: 7.5,
                  right: 140, */
                  child: Container(
                      alignment: Alignment.topCenter, child: widgetTitle[i])),
              Positioned(
                  child: Container(
                      alignment: Alignment.bottomCenter, child: widgets[i]))
            ]),
          ),
        ),
        SizedBox(
          height: 110,
        ),
      ]));
    }
  }

  return widgetrows;
}

/*   print(Lister.map((e) {
                return e.toJson();
              }).toList()); */
// print("aici avem: ${Lister[i].toJson()}");
/*  Element.sheet1!
      .wherre((element) => element.category == Category)
      .map((e) => Container(
              child: Row(
            children: [
              for (int i = 0; i < e.toJson().length; i++)
                Text(e.toJson().keys.map((e) => null).toString())

              // Text(e.toString())
            ],
          )))
      .toList(); */

/*
 Element.sheet1!.where((element) => element.category == Category).map((e) => Stack(
            children: [
      Row(
        children: [
          for (int j = 3; j < e.toJson().entries.length; j++)
            Text("${Element}"),
        ],  
      )
            ],
          )).toList(),
          */
