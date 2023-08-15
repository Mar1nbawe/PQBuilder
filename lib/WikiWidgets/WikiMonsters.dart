import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/grenze.dart';
import 'package:pqbuilder/ui/theme.dart' as ui;
import 'package:pqbuilder/wikiparsers.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'boxmeter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:pqbuilder/builder/builder.dart' as builder;
import 'dart:async';

import 'detailedinfo.dart';

List<Widget> MonsterWidget(BuildContext context, List<Monsters> monsterlist) {
  List<Widget> finalWidgetMonsters = [];
  monsterlist.sort(((a, b) {
    return a.floor.compareTo(b.floor);
  }));

  for (int i = 0; i < monsterlist.length; i++) {
    finalWidgetMonsters.add(Column(
      children: [
        GestureDetector(
          onTap: () {
            builder.logic.showDetailedInfo(
                DetailedInfoWidget(monsterinfo: monsterlist[i], counter: i));
          },
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: GradientBoxBorder(
                    gradient: LinearGradient(
                        colors:
                            ui.Theme.FloorGradients[monsterlist[i].floor - 1],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topLeft))),
            child: Stack(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: ui.Theme
                                    .FloorGradients[monsterlist[i].floor - 1],
                                tileMode: TileMode.decal)
                            .createShader(bounds);
                      },
                      child: Container(
                        child: GrenzeBorderText(
                            text: Text(
                          "${monsterlist[i].name}",
                          style: GoogleFonts.grenze(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white),
                        )),
                      ))),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: ui.Theme
                                  .FloorGradients[monsterlist[i].floor - 1],
                              tileMode: TileMode.decal)
                          .createShader(bounds);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                        ),
                        color: Color.fromRGBO(55, 55, 55, 0.5),
                      ),
                      child: GrenzeBorderText(
                          text: (monsterlist[i].floor != 9)
                              ? Text(
                                  "F${monsterlist[i].floor}D${monsterlist[i].dungeon}",
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
              Positioned(
                bottom: 0,
                child: BoxMeter(
                    counteratk: monsterlist[i].damage,
                    countersustain: monsterlist[i].sustain,
                    counterdebuff: monsterlist[i].debuff),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: (monsterlist[i].isboss == true)
                      ? MirrorAnimationBuilder<Color?>(
                          tween: ColorTween(
                              begin: Colors.purple, end: Colors.blueGrey),
                          duration: const Duration(seconds: 5),
                          builder: (context, value, _) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: value,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(8))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 1, bottom: 1),
                                child: GrenzeBorderText(
                                    text: Text("Boss",
                                        style: GoogleFonts.grenze(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            color: Colors.white))),
                              ),
                            );
                          },
                        )
                      : SizedBox()),
              //Container(child: Timer.periodic(const Duration(seconds: 1), (timer) { }),)
            ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }

  return finalWidgetMonsters;
}
