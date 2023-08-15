import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';

import "package:pqbuilder/ui/theme.dart" as ui;
import 'builder/builder.dart' as builder;
import 'ItemMenu.dart';

import 'grenze.dart';
import 'Equipment.dart';

class ItemBox extends StatefulWidget {
  ItemBox({
    Key? key,
    required this.currentItem,
    required this.database,
    required this.category,
    required this.height,
    required this.width,
  }) : super(key: key);
  List<Equipment> database;
  Equipment currentItem;
  int category;
  double width, height;
  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox>
    with AutomaticKeepAliveClientMixin<ItemBox> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    /*  print(widget.Selected.toJson().toString());
    print("\n");
    print("This returns the keys of the json i decoded: ${Selectedkeys}");
    print("-------------------------------------");
    print("This returns the entries of the json i decoded: ${SelectedStats}");
    print("\n"); */
    List<String> CurrentStats = widget.currentItem.stats
        .where((element) => element.statValue != 0)
        .map((e) => "${e.statValue}")
        .toList();
    /* List<String> Currentnames = widget.currentItem.stats
        .where((element) => element.statValue != 0)
        .map((e) => "${StatsUser().StatsNames[e.statNumber]}")
        .toList(); */
    List<int> CurrentNames = widget.currentItem.stats
        .where((element) => element.statValue != 0)
        .map((e) => e.statNumber)
        .toList();
    int element = 0;
    if (widget.currentItem.name == "Unknown Name")
      ;
    else {
      element = widget.currentItem.Element;
    }

    return Stack(
      children: [
        Align(
          alignment: Alignment(widget.height, widget.width),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                  gradient: (element == 0)
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                              Colors.grey.shade400,
                              Colors.grey.shade600,
                              Colors.grey.shade700,
                              Colors.grey.shade800,
                              Colors.black38,
                            ])
                      : LinearGradient(colors: [
                          ui.Theme.AffinityGradient[element - 1],
                          ui.Theme.AffinityGradient[element - 1]
                        ]),
                  width: 3),
            ),
            child: Stack(
              children: [
                (widget.currentItem.name == "Unknown Name")
                    ? SizedBox()
                    : Align(
                        alignment: Alignment(0, 0),
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            height: MediaQuery.of(context).size.height * 0.105,
                            width: MediaQuery.of(context).size.height * 0.12,
                            child: Image.asset(
                              'assets/equipment/${widget.currentItem.name}.png',
                              opacity: AlwaysStoppedAnimation(.45),
                              scale: 0.2,
                              filterQuality: FilterQuality.none,
                            ))),
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height * 0.105,
                    width: MediaQuery.of(context).size.height * 0.12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                            alignment: Alignment(0, -0.90),
                            child: (widget.currentItem.name == "Unknown Name")
                                ? SizedBox()
                                : GrenzeBorderText(
                                    text: Text(
                                      "${widget.currentItem.name}",
                                      style: GoogleFonts.grenze(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.012,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    borderWidth:
                                        MediaQuery.of(context).size.width *
                                            0.003,
                                  )),
                        for (int i = 0; i < CurrentStats.length; i++)
                          (widget.currentItem.name == "Unknown Name")
                              ? SizedBox()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (CurrentNames[i] < 10)
                                      Image.asset(
                                        "assets/${CurrentNames[i] + 1}.png",
                                        scale: 1.5,
                                        filterQuality: FilterQuality.none,
                                      )
                                    else if (CurrentNames[i] >= 10 &&
                                        CurrentNames[i] <= 13)
                                      Image.asset(
                                        "assets/P${CurrentNames[i] - 10}.png",
                                        scale: 1.5,
                                        filterQuality: FilterQuality.none,
                                      )
                                    else if (CurrentNames[i] > 13)
                                      Image.asset(
                                        "assets/R${CurrentNames[i] - 14}.png",
                                        scale: 1.5,
                                        filterQuality: FilterQuality.none,
                                      ),
                                    GrenzeBorderText(
                                      text: (int.parse(CurrentStats[i]) > 0)
                                          ? Text(
                                              "  +${CurrentStats[i]}",
                                              style: GoogleFonts.grenze(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.014,
                                              ),
                                              textAlign: TextAlign.center,
                                            )
                                          : Text(
                                              "  ${CurrentStats[i]}",
                                              style: GoogleFonts.grenze(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.014,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                      borderWidth:
                                          MediaQuery.of(context).size.width *
                                              0.003,
                                    ),
                                  ],
                                ),
                      ],
                    ),
                  ),
                ),
                /*  Align(
                  alignment: Alignment(0, -1),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 4; i < SelectedStats.length; i++)
                          if (SelectedStats[i] != "0")
                            Text(
                              "${Selectedkeys[i]}: ${SelectedStats[i]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018,
                              ),
                            ),
                      ],
                    ),
                  ),
                ), */
                Align(
                  alignment: Alignment(0, 1),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.141,
                      child: GestureDetector(onTap: () {
                        builder.logic.ShowWidgetOnTop(ItemMenu(
                            Lister: widget.database,
                            Category: widget.category));
                      })),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
