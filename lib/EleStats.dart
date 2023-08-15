import 'package:flutter/material.dart';
import "package:pqbuilder/ui/theme.dart" as ui;
import 'BorderText.dart';
import 'grenze.dart';
import "package:google_fonts/google_fonts.dart";

class EleShowStats extends StatelessWidget {
  const EleShowStats({
    Key? key,
    required this.StatsName,
    required this.image,
    required this.stat,
    required this.width,
    required this.height,
    required this.counter,
    required this.Grad1,
    required this.Grad2,
  }) : super(key: key);
  final List<String> StatsName;
  final String image;
  final List<double> stat;
  // final MasteryPaths mastery;
  final double width, height;
  final int counter;
  final Color Grad1, Grad2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            BordersWidget(
              borderColor: LinearGradient(colors: [Grad1, Grad2]),
              child: Container(
                child: Align(
                    alignment: Alignment(height, width),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Image.asset(
                                'assets/P${counter - 10}.png',
                                filterQuality: FilterQuality.none,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: GrenzeBorderText(
                                text: Text("${stat[counter].toInt()}",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.0284,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                borderWidth:
                                    MediaQuery.of(context).size.width * 0.006,
                                borderColor: ui.Theme.darkDarkest,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Image.asset(
                                'assets/R${counter - 10}.png',
                                filterQuality: FilterQuality.none,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: GrenzeBorderText(
                                text: Text(" ${stat[counter + 4].toInt()}",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.0284,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                borderWidth:
                                    MediaQuery.of(context).size.width * 0.006,
                                borderColor: ui.Theme.darkDarkest,
                              ),
                            ),
                          ],
                        ))),
              ),
            )
          ],
        ),
      ],
    );
  }
}


/*  GrenzeBorderText(
                                text: Text(
                                    "${StatsName[counter]}: ${stat[counter].toInt()}",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.0284,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                borderWidth:
                                    MediaQuery.of(context).size.width * 0.006,
                                borderColor: ui.Theme.darkDarkest,
                              ), */