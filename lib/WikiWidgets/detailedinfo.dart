import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/WikiWidgets/boxmeter.dart';
import 'package:pqbuilder/grenze.dart';
import 'package:pqbuilder/ui/theme.dart' as ui;
import 'package:pqbuilder/wikiparsers.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:pqbuilder/builder/builder.dart' as builder;
import 'statsinfos.dart';

class DetailedInfoWidget extends StatelessWidget {
  DetailedInfoWidget(
      {Key? key, required this.monsterinfo, required this.counter})
      : super(key: key);
  Monsters monsterinfo;
  int counter;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        builder.logic.changevisdetailed();
        print(builder.logic.detailedvisible);
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.2),
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1)),
            ],
            border: Border.all(),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ui.Theme.darkDarkest, width: 4),
                  borderRadius: BorderRadius.circular(35),
                  color: Color.fromRGBO(35, 35, 35, 1)),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0, -1),
                    child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: (monsterinfo.isboss == false)
                                      ? ui.Theme.FoodGradients[1]
                                      : ui.Theme.FoodGradients[2])
                              .createShader(bounds);
                        },
                        child: GrenzeBorderText(
                            text: Text(
                          "${monsterinfo.name}",
                          style: GoogleFonts.grenze(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                              fontWeight: FontWeight.bold),
                        ))),
                  ),
                  Align(
                    alignment: Alignment(0, -0.8),
                    child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                                  colors: (monsterinfo.isboss == false)
                                      ? ui.Theme.FoodGradients[1]
                                      : ui.Theme.FoodGradients[2])
                              .createShader(bounds);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75)),
                          child: Divider(
                            height: MediaQuery.of(context).size.height * 0.005,
                            thickness:
                                MediaQuery.of(context).size.height * 0.005,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Align(
                    alignment: Alignment(0, -0.55),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Stack(children: [
                        Align(
                          alignment: Alignment(0, -0.7),
                          child: Image.asset(
                            "assets/monsters/${counter}.png",
                            scale: 0.23,
                            filterQuality: FilterQuality.none,
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.15,
                          right: MediaQuery.of(context).size.width * 0.25,
                          child: SizedBox(
                            child: Row(
                              children: [
                                GrenzeBorderText(
                                    text: Text("Found in: ",
                                        style: GoogleFonts.grenze(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04))),
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                            colors: ui.Theme.FloorGradients[
                                                monsterinfo.floor])
                                        .createShader(bounds);
                                  },
                                  child: GrenzeBorderText(
                                      text: Text(
                                          "D${monsterinfo.dungeon}F${monsterinfo.floor}",
                                          style: GoogleFonts.grenze(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04))),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: BoxMeter(
                            counteratk: monsterinfo.damage,
                            countersustain: monsterinfo.sustain,
                            counterdebuff: monsterinfo.debuff,
                            scalewidget: 0.9,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    right: MediaQuery.of(context).size.width * 0.1,
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Statsinfos(
                          monsterinfo: monsterinfo,
                          transformscale: 1,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
