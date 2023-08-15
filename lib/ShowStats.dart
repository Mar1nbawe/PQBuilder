import 'package:flutter/material.dart';
import 'PlayerStats.dart';
import "package:pqbuilder/ui/theme.dart" as ui;
import 'BorderText.dart';
import 'grenze.dart';
import "package:google_fonts/google_fonts.dart";

class ShowStats extends StatelessWidget {
  const ShowStats({
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
  final String StatsName;
  final String image;
  final double stat;
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
                        width: MediaQuery.of(context).size.width * 0.20,
                        height: MediaQuery.of(context).size.height * 0.03,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/${image}.png',
                                  filterQuality: FilterQuality.none,
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: GrenzeBorderText(
                                text: Text("${stat.toInt()}",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.0304,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                borderWidth:
                                    MediaQuery.of(context).size.width * 0.006,
                                borderColor: ui.Theme.darkDarkest,
                              ),
                            )
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

final BorderDeco = BoxDecoration(
  gradient: LinearGradient(colors: [Colors.blue, Colors.redAccent]),
  border: Border.all(
    color: ui.Theme.darkDarkest,
  ),
  borderRadius: BorderRadius.circular(32),
);


/* GrenzeBorderText(
                                text: Text("$StatsName:",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.0304,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                borderWidth:
                                    MediaQuery.of(context).size.width * 0.006,
                                borderColor: ui.Theme.darkDarkest,
                              ), */