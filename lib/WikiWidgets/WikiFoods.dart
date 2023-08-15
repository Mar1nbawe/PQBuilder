import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/WikiWidgets/detailedinfo.dart';
import 'package:pqbuilder/grenze.dart';
import 'package:pqbuilder/ui/theme.dart' as ui;
import 'package:pqbuilder/wikiparsers.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:pqbuilder/builder/builder.dart' as builder;

List<Widget> FoodWidget(BuildContext context, List<Foods> FoodList) {
  List<Widget> FoodStats = [];
  List<Widget> FoodWidgetList = [];
  List<Widget> FoodWidgetTitles = [];
  List<Widget> finalWidgetFoods = [];
  List<String> StatsNames = [
    "HP", //0
    "Atk", //1
    "Def", //2
    "Mdef", //3
    "Mag", //4
    "Crit C", //5
    "Crit P", //6
    "Agl", //7
    "Eva", //8
    "Heal", //9
    "Earth P", //10
    "Water P", // 11
    "Fire P", // 12
    "Air P", // 13
    "Earth R", // 14
    "Water R", // 15
    "Fire R", //16
    "Air R" //17
  ];

  FoodList.sort((a, b) {
    return a.gradient.compareTo(b.gradient);
  });

  FoodList.forEach((e) {
    FoodWidgetTitles.add(GrenzeBorderText(
        text: Text("${e.name}",
            style: GoogleFonts.grenze(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold))));

    FoodWidgetList.add(GrenzeBorderText(
        text: Text(
            "${e.resource[0]} + ${e.resource[1]} " +
                ((e.resource[2] != "N/A") ? "+ ${e.resource[2]}" : ""),
            style: GoogleFonts.grenze(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold))));

    FoodStats.add(GrenzeBorderText(
      text: Text(
          "${e.stats.where((element) => element.statValue != 0).map((e) => "${StatsNames[e.statNumber]} = ${e.statValue.toString()}")}",
          style: GoogleFonts.grenze(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.bold)),
    ));
  });

  for (int i = 0; i < FoodWidgetList.length; i++) {
    finalWidgetFoods.add(Stack(
      children: [
        GestureDetector(
          onTap: () {
            /* builder.logic.builderwidgets.forEach((element) {
              (element.widgetname == FoodList[i].name)
                  ? print(element.widgetname)
                  : null;
            }); */
            /* 
        DE COMPLETAT AICI MAI TARZIU
        VOM COMPLETA WIKIUL
         */
          },
          child: Container(
            height: 95,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: GradientBoxBorder(
                  gradient: LinearGradient(
                      colors: ui.Theme.FoodGradients[FoodList[i].gradient - 1],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter)),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              tileMode: TileMode.decal,
                              colors: ui.Theme
                                  .FoodGradients[FoodList[i].gradient - 1])
                          .createShader(bounds);
                    },
                    child: FoodWidgetTitles[i],
                  ),
                  FoodWidgetList[i],
                  FoodStats[i]
                ]),
          ),
        ),
        SizedBox(
          height: 105,
        ),
      ],
    ));
  }

  return finalWidgetFoods;
}
