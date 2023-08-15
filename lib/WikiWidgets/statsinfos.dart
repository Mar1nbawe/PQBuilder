import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/WikiWidgets/boxmeter.dart';
import 'package:pqbuilder/grenze.dart';
import 'package:pqbuilder/ui/theme.dart' as ui;
import 'package:pqbuilder/wikiparsers.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:pqbuilder/builder/builder.dart' as builder;

class Statsinfos extends StatelessWidget {
  Statsinfos({Key? key, required this.monsterinfo, this.transformscale})
      : super(key: key);
  Monsters monsterinfo;
  double? transformscale;
  String test = '';

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < monsterinfo.drop.length; i++) {
      if (i % 2 == 0 && i != 0) test += "\n";
      test += monsterinfo.drop[i];

      if (i != monsterinfo.drop.length - 1) test += ", ";

//+
    }

    return Transform.scale(
      scale: transformscale ?? 1,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GrenzeBorderText(
                      text: Text(
                    "Damage: ",
                    style: GoogleFonts.grenze(color: Colors.white),
                  )),
                  for (int i = 0; i < monsterinfo.attack.length; i++)
                    (monsterinfo.attack[i] == "-")
                        ? GrenzeBorderText(
                            text: Text(
                            "${monsterinfo.weakness[i]} ",
                            style: GoogleFonts.grenze(color: Colors.white),
                          ))
                        : Image.asset(
                            "assets/Icons/${monsterinfo.attack[i]}.png")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GrenzeBorderText(
                      text: Text(
                    "Weakness: ",
                    style: GoogleFonts.grenze(color: Colors.white),
                  )),
                  for (int i = 0; i < monsterinfo.weakness.length; i++)
                    (monsterinfo.weakness[i] == "-")
                        ? GrenzeBorderText(
                            text: Text(
                            "${monsterinfo.weakness[i]} ",
                            style: GoogleFonts.grenze(color: Colors.white),
                          ))
                        : Image.asset(
                            "assets/Icons/${monsterinfo.weakness[i]}.png")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GrenzeBorderText(
                      text: Text(
                    "Resistance: ",
                    style: GoogleFonts.grenze(color: Colors.white),
                  )),
                  for (int i = 0; i < monsterinfo.resistance.length; i++)
                    (monsterinfo.resistance[i] == "-")
                        ? GrenzeBorderText(
                            text: Text(
                            "${monsterinfo.resistance[i]} ",
                            style: GoogleFonts.grenze(color: Colors.white),
                          ))
                        : Image.asset(
                            "assets/Icons/${monsterinfo.resistance[i]}.png")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GrenzeBorderText(
                      text: Text(
                    "Loot: ${test}",
                    style: GoogleFonts.grenze(color: Colors.white),
                    maxLines: 5,
                    textAlign: TextAlign.center,
                  )),
                  /*  for (int i = 0; i < monsterinfo.drop.length; i++)

                    /*     Image.asset("assets/Icons/${monsterinfo.dro}") */
                    GrenzeBorderText(
                        text: Text(
                      "${monsterinfo.drop[i]} ",
                      style: GoogleFonts.grenze(color: Colors.white),
                      maxLines: 3,
                      softWrap: true,
                    )), */
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
