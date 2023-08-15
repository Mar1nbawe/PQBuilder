import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/grenze.dart';
import 'package:pqbuilder/ui/theme.dart' as ui;
import 'package:pqbuilder/wikiparsers.dart';
import 'package:gradient_borders/gradient_borders.dart';

class BoxMeter extends StatelessWidget {
  BoxMeter(
      {Key? key,
      required this.counteratk,
      required this.countersustain,
      required this.counterdebuff,
      this.scalewidget})
      : super(key: key);

  int counteratk;
  int countersustain;
  int counterdebuff;
  double? scalewidget;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scalewidget ?? 1,
      child: Container(
        height: 100,
        width: 327,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            GrenzeBorderText(
              text: Text("Attack",
                  style: GoogleFonts.grenze(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: 15,
            ),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Row(
                    children: [
                      (counteratk > i)
                          ? Container(
                              height: 20,
                              width: 40,
                              transform: Matrix4.skewX(-.3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.bottomRight,
                                      colors: ui.Theme.BoxColors[i])),
                            )
                          : Container(
                              height: 20,
                              width: 40,
                              transform: Matrix4.skewX(-.3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.grey.shade500),
                            ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
              ],
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            GrenzeBorderText(
                text: Text("Sustain",
                    style: GoogleFonts.grenze(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold))),
            SizedBox(
              width: 15,
            ),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Row(
                    children: [
                      (countersustain > i)
                          ? Container(
                              height: 20,
                              width: 40,
                              transform: Matrix4.skewX(-.3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.bottomRight,
                                      colors: ui.Theme.BoxColors[i])),
                            )
                          : Container(
                              height: 20,
                              width: 40,
                              transform: Matrix4.skewX(-.3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.grey.shade500),
                            ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
              ],
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            GrenzeBorderText(
                text: Text("Debuff",
                    style: GoogleFonts.grenze(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold))),
            SizedBox(
              width: 15,
            ),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Row(
                    children: [
                      (counterdebuff > i)
                          ? Container(
                              height: 20,
                              width: 40,
                              transform: Matrix4.skewX(-.3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.bottomRight,
                                      colors: ui.Theme.BoxColors[i])),
                            )
                          : Container(
                              height: 20,
                              width: 40,
                              transform: Matrix4.skewX(-.3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.grey.shade500),
                            ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
              ],
            ),
          ]),
        ]),
      ),
    );
  }
}
