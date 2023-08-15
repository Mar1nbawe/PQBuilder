import 'dart:math';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/grenze.dart';
import 'package:pqbuilder/ShowStats.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'EleStats.dart';
import 'Equipmentfuncs.dart';
import 'ItemBox.dart';
import 'app.dart' as app;
import 'builder/builder.dart' as builder;
import 'package:image/image.dart' as img;
import 'package:screenshot/screenshot.dart';
import 'main.dart' as main;
import 'ui/theme.dart' as ui;
import 'app.dart';
import 'Equipment.dart';

ScreenshotController screenshotController = ScreenshotController();

bool boolpaint(double c1, c2) {
  if (c1 >= c2)
    return false;
  else
    return true;
}

GlobalKey previewContainer = new GlobalKey();

class PainterImg extends StatelessWidget {
  PainterImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Stack(children: [
        Positioned(
            width: 125,
            height: 200,
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.03,
            child: Container(
              child: Align(
                alignment: Alignment(0.2, 0.5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 86,
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                    Color.fromRGBO(255, 0, 0, 1),
                                    Color.fromRGBO(255, 120, 0, 1)
                                  ]))),
                        ),
                      ),
                      Positioned(
                        top: 23,
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                    Colors.blue,
                                    Colors.lightBlue
                                  ]))),
                        ),
                      ),
                      Positioned(
                        top: 54,
                        left: 8,
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                    ui.Theme.PathGradientDark[3],
                                    ui.Theme.PathGradientDark[4]
                                  ]))),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 54,
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                    Color.fromRGBO(0, 130, 0, 1),
                                    Color.fromRGBO(0, 200, 0, 1)
                                  ]))),
                        ),
                      ),
                      Positioned(
                        top: 43,
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(255, 255, 255, 0.4)),
                            child: Stack(
                              children: [
                                Transform.rotate(
                                  angle: -pi / 4,
                                  child: Align(
                                    alignment: Alignment(0, -1.3),
                                    child: GrenzeBorderText(
                                        text: Text(
                                            '${builder.logic.character1.Affinity[1]}',
                                            style: GoogleFonts.grenze(
                                                fontSize: 18,
                                                color: Colors.white))),
                                  ),
                                ),
                                Transform.rotate(
                                  angle: -pi / 4,
                                  child: Align(
                                    alignment: Alignment(1.3, -0.1),
                                    child: GrenzeBorderText(
                                        text: Text(
                                            '${builder.logic.character1.Affinity[2]}',
                                            style: GoogleFonts.grenze(
                                                fontSize: 18,
                                                color: Colors.white))),
                                  ),
                                ),
                                Transform.rotate(
                                  angle: -pi / 4,
                                  child: Align(
                                    alignment: Alignment(-1.3, -0.1),
                                    child: GrenzeBorderText(
                                        text: Text(
                                            '${builder.logic.character1.Affinity[3]}',
                                            style: GoogleFonts.grenze(
                                                fontSize: 18,
                                                color: Colors.white))),
                                  ),
                                ),
                                Transform.rotate(
                                  angle: -pi / 4,
                                  child: Align(
                                    alignment: Alignment(0, 1.3),
                                    child: GrenzeBorderText(
                                        text: Text(
                                            '${builder.logic.character1.Affinity[0]}',
                                            style: GoogleFonts.grenze(
                                                fontSize: 18,
                                                color: Colors.white))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.8,
          child: SizedBox(
            width: 400,
            height: 800,
            child: CustomPaint(
              painter: DemoPainter(),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.2, -0.9),
          child: Container(
            child: Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.32,
                  maxHeight: MediaQuery.of(context).size.height * 0.75,
                  maxWidth: MediaQuery.of(context).size.height * 0.62),
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.32,
              child: Stack(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 5; i++)
                          Selector<builder.BuilderLogic, int>(
                              selector: (_, bl) => 0,
                              shouldRebuild: (bl, new_) => true,
                              builder: (_, ___, __) {
                                return ShowStats(
                                    StatsName: Character.StatsNames[i],
                                    image: Character.StatsNames[i],
                                    stat: Character.Stats[i],
                                    height: 0,
                                    width: -0.5,
                                    counter: i,
                                    Grad1: Colors.blue,
                                    Grad2: Colors.deepPurple);
                              }),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 5; i < 10; i++)
                          Selector<builder.BuilderLogic, int>(
                              selector: (_, bl) => 0,
                              shouldRebuild: (bl, new_) => true,
                              builder: (_, ___, __) {
                                return ShowStats(
                                    StatsName: Character.StatsNames[i],
                                    image: Character.StatsNames[i],
                                    stat: Character.Stats[i],
                                    height: 0,
                                    width: -0.5,
                                    counter: i,
                                    Grad1: Colors.blue,
                                    Grad2: Colors.deepPurple);
                              }),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 10; i < 14; i++)
                          Selector<builder.BuilderLogic, int>(
                              selector: (_, bl) => 0,
                              shouldRebuild: (bl, new_) => true,
                              builder: (_, ___, __) {
                                return EleShowStats(
                                    StatsName: Character.StatsNames,
                                    image: Character.StatsNames[i],
                                    stat: Character.Stats,
                                    height: 0,
                                    width: -0.8,
                                    counter: i,
                                    Grad1: Colors.blue,
                                    Grad2: Colors.deepPurple);
                              }),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
        Selector<builder.BuilderLogic, Tuple2<List<Equipment>, Equipment>>(
            selector: (_, bl) =>
                Tuple2(main.SortedItems[6], builder.logic.Saver[6]),
            builder: (_, bl, __) {
              return Visibility(
                child: Align(
                    alignment: Alignment(0, -0.7),
                    child: ItemBox(
                      currentItem: bl.item2,
                      database: bl.item1,
                      category: 6,
                      height: 0.9,
                      width: 0.4,
                    )),
              );
            }),
        Selector<builder.BuilderLogic, Tuple2<List<Equipment>, Equipment>>(
            selector: (_, bl) =>
                Tuple2(main.SortedItems[0], builder.logic.Saver[0]),
            builder: (_, bl, __) {
              return Visibility(
                child: Align(
                    alignment: Alignment(-0.5, -0.7),
                    child: ItemBox(
                      currentItem: builder.logic.Saver[0],
                      database: main.SortedItems[0],
                      category: 0,
                      height: -0.9,
                      width: 0.4,
                    )),
              );
            }),
        Selector<builder.BuilderLogic, Tuple2<List<Equipment>, Equipment>>(
            selector: (_, bl) =>
                Tuple2(main.SortedItems[1], builder.logic.Saver[1]),
            builder: (_, bl, __) {
              return Visibility(
                child: Align(
                    alignment: Alignment(-0.5, -0.7),
                    child: ItemBox(
                      currentItem: builder.logic.Saver[1],
                      database: main.SortedItems[1],
                      category: 1,
                      height: -0.9,
                      width: 0.9,
                    )),
              );
            }),
        Selector<builder.BuilderLogic, Tuple2<List<Equipment>, Equipment>>(
            selector: (_, bl) =>
                Tuple2(main.SortedItems[2], builder.logic.Saver[2]),
            builder: (_, bl, __) {
              return Visibility(
                child: Align(
                    alignment: Alignment(-0.5, -0.7),
                    child: ItemBox(
                      currentItem: builder.logic.Saver[2],
                      database: main.SortedItems[2],
                      category: 2,
                      height: 0,
                      width: -0.155,
                    )),
              );
            }),
        Selector<builder.BuilderLogic, Tuple2<List<Equipment>, Equipment>>(
            selector: (_, bl) =>
                Tuple2(main.SortedItems[3], builder.logic.Saver[3]),
            builder: (_, bl, __) {
              return Visibility(
                child: Align(
                    alignment: Alignment(-0.5, -0.7),
                    child: ItemBox(
                      currentItem: builder.logic.Saver[3],
                      database: main.SortedItems[3],
                      category: 3,
                      height: 0,
                      width: 0.23,
                    )),
              );
            }),
        Selector<builder.BuilderLogic, Tuple2<List<Equipment>, Equipment>>(
            selector: (_, bl) =>
                Tuple2(main.SortedItems[4], builder.logic.Saver[4]),
            builder: (_, bl, __) {
              return Visibility(
                child: Align(
                    alignment: Alignment(-0.3, -0.7),
                    child: ItemBox(
                      currentItem: builder.logic.Saver[4],
                      database: main.SortedItems[4],
                      category: 4,
                      height: 0,
                      width: 0.615,
                    )),
              );
            }),
        Selector<builder.BuilderLogic, Tuple2<List<Equipment>, Equipment>>(
            selector: (_, bl) =>
                Tuple2(main.SortedItems[5], builder.logic.Saver[5]),
            builder: (_, bl, __) {
              return Visibility(
                child: Align(
                    alignment: Alignment(-0.6, -0.7),
                    child: ItemBox(
                      currentItem: builder.logic.Saver[5],
                      database: main.SortedItems[5],
                      category: 5,
                      height: 0,
                      width: 1,
                    )),
              );
            }),
      ]),
    );
  }
}

class DemoPainter extends CustomPainter {
  @override
  paint(Canvas canvas, Size size) {
    canvas.scale(0.17);
// Paint your canvas as you want

    int test = 21;
    double circlesize = 200;
    var center = size / 2;
    var paintcircle = Paint()
      ..color = Colors.grey
      ..strokeWidth = 5;

    var completedcircle = Paint()
      ..color = Colors.green
      ..strokeWidth = 5;

    var painthollow = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    //paintings

    //============MAGE WARRIOR AND ROGUE INNER CIRCLE===============

    //===========MAGE===============

    //mage sk1
    (boolpaint(builder.logic.character1.Path[8], 1))
        ? canvas.drawCircle(Offset(-35, -85), 10, paintcircle)
        : canvas.drawCircle(Offset(-35, -85), 10, completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 1))
        ? canvas.drawLine(
            Offset(0 - 15, 0 - 0), Offset(-33.0, -85), paintcircle)
        : canvas.drawLine(
            Offset(0 - 15, 0 - 0), Offset(-33.0, -85), completedcircle);

    //mage sk2
    (boolpaint(builder.logic.character1.Path[8], 5))
        ? canvas.drawCircle(Offset(-60, -30), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, -30), 10, completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 2))
        ? canvas.drawLine(Offset(-35, -85), Offset(-60.0, -30), paintcircle)
        : canvas.drawLine(
            Offset(-35, -85), Offset(-60.0, -30), completedcircle);

    //mage sk3
    (boolpaint(builder.logic.character1.Path[8], 6))
        ? canvas.drawLine(Offset(-60, -30), Offset(-82.0, 25), paintcircle)
        : canvas.drawLine(Offset(-60, -30), Offset(-82.0, 25), completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 15))
        ? canvas.drawCircle(Offset(-85, 25), 10, paintcircle)
        : canvas.drawCircle(Offset(-85, 25), 10, completedcircle);

    //mage sk4
    (boolpaint(builder.logic.character1.Path[8], 16))
        ? canvas.drawLine(Offset(-85, 25), Offset(-95.0, -45), paintcircle)
        : canvas.drawLine(Offset(-85, 25), Offset(-95.0, -45), completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 25))
        ? canvas.drawCircle(Offset(-95, -45), 10, paintcircle)
        : canvas.drawCircle(Offset(-95, -45), 10, completedcircle);

    //mage sk5
    (boolpaint(builder.logic.character1.Path[8], 26))
        ? canvas.drawLine(Offset(-95, -45), Offset(-103.0, -105), paintcircle)
        : canvas.drawLine(
            Offset(-95, -45), Offset(-103.0, -105), completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 30))
        ? canvas.drawCircle(Offset(-103, -105), 10, paintcircle)
        : canvas.drawCircle(Offset(-103, -105), 10, completedcircle);

    //mage sk6
    (boolpaint(builder.logic.character1.Path[8], 31))
        ? canvas.drawLine(Offset(-103, -105), Offset(-140.0, -70), paintcircle)
        : canvas.drawLine(
            Offset(-103, -105), Offset(-140.0, -70), completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 40))
        ? canvas.drawCircle(Offset(-140.0, -70), 10, paintcircle)
        : canvas.drawCircle(Offset(-140.0, -70), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 41))
        ? canvas.drawLine(
            Offset(-140, -70), Offset(-circlesize + 25, 0 - 95), paintcircle)
        : canvas.drawLine(Offset(-140, -70), Offset(-circlesize + 25, 0 - 95),
            completedcircle);

    //===========ROGUE===============

    //rogue sk1
    (boolpaint(builder.logic.character1.Path[4], 1))
        ? canvas.drawLine(Offset(0 - 2, 0 + 15), Offset(-60.0, 70), paintcircle)
        : canvas.drawLine(
            Offset(0 - 2, 0 + 15), Offset(-60.0, 70), completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 1))
        ? canvas.drawCircle(Offset(-60.0, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(-60.0, 70), 10, completedcircle);

    //rogue sk2
    (boolpaint(builder.logic.character1.Path[4], 2))
        ? canvas.drawLine(Offset(-60.0, 70), Offset(0, 70), paintcircle)
        : canvas.drawLine(Offset(-60.0, 70), Offset(0, 70), completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 5))
        ? canvas.drawCircle(Offset(0, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 70), 10, completedcircle);

    //rogue sk3
    (boolpaint(builder.logic.character1.Path[4], 6))
        ? canvas.drawCircle(Offset(60, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(60, 70), 10, completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 15))
        ? canvas.drawLine(Offset(0, 70), Offset(60, 70), paintcircle)
        : canvas.drawLine(Offset(0, 70), Offset(60, 70), completedcircle);

    //rogue sk4
    (boolpaint(builder.logic.character1.Path[4], 16))
        ? canvas.drawLine(Offset(60, 70), Offset(0, 110), paintcircle)
        : canvas.drawLine(Offset(60, 70), Offset(0, 110), completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 25))
        ? canvas.drawCircle(Offset(0, 110), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 110), 10, completedcircle);

    //rogue sk5
    (boolpaint(builder.logic.character1.Path[4], 26))
        ? canvas.drawLine(Offset(0, 110), Offset(-60, 150), paintcircle)
        : canvas.drawLine(Offset(0, 110), Offset(-60, 150), completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 30))
        ? canvas.drawCircle(Offset(-60, 150), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, 150), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 41))
        ? canvas.drawLine(Offset(0, 150), Offset(0, circlesize), paintcircle)
        : canvas.drawLine(
            Offset(0, 150), Offset(0, circlesize), completedcircle);

    //rogue sk6
    (boolpaint(builder.logic.character1.Path[4], 40))
        ? canvas.drawCircle(Offset(0, 150), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 150), 10, completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 31))
        ? canvas.drawLine(Offset(-60, 150), Offset(0, 150), paintcircle)
        : canvas.drawLine(Offset(-60, 150), Offset(0, 150), completedcircle);

    //===========WARRIOR===============

    //warrior sk1
    (boolpaint(builder.logic.character1.Path[0], 1))
        ? canvas.drawLine(
            Offset(0 + 15, 0 - 7.5), Offset(0 + 75, 25), paintcircle)
        : canvas.drawLine(
            Offset(0 + 15, 0 - 7.5), Offset(0 + 75, 25), completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 1))
        ? canvas.drawCircle(Offset(0 + 75, 25), 10, paintcircle)
        : canvas.drawCircle(Offset(0 + 75, 25), 10, completedcircle);

    //warrior sk2
    (boolpaint(builder.logic.character1.Path[0], 2))
        ? canvas.drawLine(Offset(0 + 75, 25), Offset(60, -30), paintcircle)
        : canvas.drawLine(Offset(0 + 75, 25), Offset(60, -30), completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 5))
        ? canvas.drawCircle(Offset(60, -30), 10, paintcircle)
        : canvas.drawCircle(Offset(60, -30), 10, completedcircle);

    //warrior sk3
    (boolpaint(builder.logic.character1.Path[0], 6))
        ? canvas.drawLine(Offset(60, -30), Offset(45, -85), paintcircle)
        : canvas.drawLine(Offset(60, -30), Offset(45, -85), completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 15))
        ? canvas.drawCircle(Offset(45, -85), 10, paintcircle)
        : canvas.drawCircle(Offset(45, -85), 10, completedcircle);

    //warrior sk4
    (boolpaint(builder.logic.character1.Path[0], 16))
        ? canvas.drawLine(Offset(45, -85), Offset(105, -45), paintcircle)
        : canvas.drawLine(Offset(45, -85), Offset(105, -45), completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 25))
        ? canvas.drawCircle(Offset(105, -45), 10, paintcircle)
        : canvas.drawCircle(Offset(105, -45), 10, completedcircle);

    //warrior sk5
    (boolpaint(builder.logic.character1.Path[0], 26))
        ? canvas.drawLine(Offset(105, -45), Offset(165, -7), paintcircle)
        : canvas.drawLine(Offset(105, -45), Offset(165, -7), completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 30))
        ? canvas.drawCircle(Offset(165, -7), 10, paintcircle)
        : canvas.drawCircle(Offset(165, -7), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 41))
        ? canvas.drawLine(
            Offset(140.0, -70), Offset(circlesize - 25, 0 - 95), paintcircle)
        : canvas.drawLine(Offset(140.0, -70), Offset(circlesize - 25, 0 - 95),
            completedcircle);

    //warrior sk6

    (boolpaint(builder.logic.character1.Path[0], 31))
        ? canvas.drawCircle(Offset(140.0, -70), 10, paintcircle)
        : canvas.drawCircle(Offset(140.0, -70), 10, completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 40))
        ? canvas.drawLine(Offset(165, -7), Offset(140.0, -70), paintcircle)
        : canvas.drawLine(Offset(165, -7), Offset(140.0, -70), completedcircle);

    //============END OF MAGE WARRIOR AND ROGUE INNER CIRCLE===============

    //=========MAGE WARRIOR AND ROGUE OUTER CIRCLE AND FINAL PATHS=========

    //======================OUTER MAGE==========================

    //outer mage sk1
    (boolpaint(builder.logic.character1.Path[8], 51))
        ? canvas.drawLine(
            Offset(-circlesize + 25, 0 - 95), Offset(-240.0, -65), paintcircle)
        : canvas.drawLine(Offset(-circlesize + 25, 0 - 95), Offset(-240.0, -65),
            completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 60))
        ? canvas.drawCircle(Offset(-240.0, -65), 10, paintcircle)
        : canvas.drawCircle(Offset(-240.0, -65), 10, completedcircle);

    //outer mage sk2
    (boolpaint(builder.logic.character1.Path[8], 61))
        ? canvas.drawLine(
            Offset(-240.0, -65), Offset(-210.0, -125), paintcircle)
        : canvas.drawLine(
            Offset(-240.0, -65), Offset(-210.0, -125), completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 65))
        ? canvas.drawCircle(Offset(-210.0, -125), 10, paintcircle)
        : canvas.drawCircle(Offset(-210.0, -125), 10, completedcircle);

    //outer mage sk3
    (boolpaint(builder.logic.character1.Path[8], 66))
        ? canvas.drawLine(
            Offset(-210.0, -125), Offset(-185.0, -175), paintcircle)
        : canvas.drawLine(
            Offset(-210.0, -125), Offset(-185.0, -175), completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 70))
        ? canvas.drawCircle(Offset(-185.0, -175), 10, paintcircle)
        : canvas.drawCircle(Offset(-185.0, -175), 10, completedcircle);

    //outer mage sk4
    (boolpaint(builder.logic.character1.Path[8], 71))
        ? canvas.drawLine(
            Offset(-185.0, -175), Offset(-245.0, -148), paintcircle)
        : canvas.drawLine(
            Offset(-185.0, -175), Offset(-245.0, -148), completedcircle);
    (boolpaint(builder.logic.character1.Path[8], 75))
        ? canvas.drawCircle(Offset(-245.0, -148), 10, paintcircle)
        : canvas.drawCircle(Offset(-245.0, -148), 10, completedcircle);

    //necro sk1
    (boolpaint(builder.logic.character1.Path[10], 1))
        ? canvas.drawLine(
            Offset(-245.0, -148), Offset(-285.0, -132), paintcircle)
        : canvas.drawLine(
            Offset(-245.0, -148), Offset(-285.0, -132), completedcircle);
    (boolpaint(builder.logic.character1.Path[10], 10))
        ? canvas.drawCircle(Offset(-285.0, -132), 10, paintcircle)
        : canvas.drawCircle(Offset(-285.0, -132), 10, completedcircle);

    //necro sk2
    (boolpaint(builder.logic.character1.Path[10], 11))
        ? canvas.drawLine(
            Offset(-285.0, -132), Offset(-325.0, -134), paintcircle)
        : canvas.drawLine(
            Offset(-285.0, -132), Offset(-325.0, -134), completedcircle);
    (boolpaint(builder.logic.character1.Path[10], 20))
        ? canvas.drawCircle(Offset(-325.0, -134), 10, paintcircle)
        : canvas.drawCircle(Offset(-325.0, -134), 10, completedcircle);

    //necro sk3
    (boolpaint(builder.logic.character1.Path[10], 21))
        ? canvas.drawLine(
            Offset(-325.0, -134), Offset(-365.0, -155), paintcircle)
        : canvas.drawLine(
            Offset(-325.0, -134), Offset(-365.0, -155), completedcircle);
    (boolpaint(builder.logic.character1.Path[10], 25))
        ? canvas.drawCircle(Offset(-365.0, -155), 10, paintcircle)
        : canvas.drawCircle(Offset(-365.0, -155), 10, completedcircle);

    //druid sk1
    (boolpaint(builder.logic.character1.Path[9], 1))
        ? canvas.drawLine(
            Offset(-245.0, -148), Offset(-270.0, -185), paintcircle)
        : canvas.drawLine(
            Offset(-245.0, -148), Offset(-270.0, -185), completedcircle);
    (boolpaint(builder.logic.character1.Path[9], 10))
        ? canvas.drawCircle(Offset(-270.0, -185), 10, paintcircle)
        : canvas.drawCircle(Offset(-270.0, -185), 10, completedcircle);

    //druid sk2
    (boolpaint(builder.logic.character1.Path[9], 11))
        ? canvas.drawLine(
            Offset(-270.0, -185), Offset(-300.0, -210), paintcircle)
        : canvas.drawLine(
            Offset(-270.0, -185), Offset(-300.0, -210), completedcircle);
    (boolpaint(builder.logic.character1.Path[9], 20))
        ? canvas.drawCircle(Offset(-300.0, -210), 10, paintcircle)
        : canvas.drawCircle(Offset(-300.0, -210), 10, completedcircle);

    //druid sk3
    (boolpaint(builder.logic.character1.Path[9], 21))
        ? canvas.drawLine(
            Offset(-300.0, -210), Offset(-340.0, -225), paintcircle)
        : canvas.drawLine(
            Offset(-300.0, -210), Offset(-340.0, -225), completedcircle);
    (boolpaint(builder.logic.character1.Path[9], 25))
        ? canvas.drawCircle(Offset(-340.0, -225), 10, paintcircle)
        : canvas.drawCircle(Offset(-340.0, -225), 10, completedcircle);

    //=====================OUTER ROGUE========================

    //outer rogue sk1
    (boolpaint(builder.logic.character1.Path[4], 51))
        ? canvas.drawLine(Offset(0, circlesize), Offset(60, 240), paintcircle)
        : canvas.drawLine(
            Offset(0, circlesize), Offset(60, 240), completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 60))
        ? canvas.drawCircle(Offset(60, 240), 10, paintcircle)
        : canvas.drawCircle(Offset(60, 240), 10, completedcircle);

    //outer rogue sk2
    (boolpaint(builder.logic.character1.Path[4], 61))
        ? canvas.drawLine(Offset(60, 240), Offset(0, 240), paintcircle)
        : canvas.drawLine(Offset(60, 240), Offset(0, 240), completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 65))
        ? canvas.drawCircle(Offset(0, 240), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 240), 10, completedcircle);

    //outer rogue sk3
    (boolpaint(builder.logic.character1.Path[4], 66))
        ? canvas.drawLine(Offset(0, 240), Offset(-60, 240), paintcircle)
        : canvas.drawLine(Offset(0, 240), Offset(-60, 240), completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 70))
        ? canvas.drawCircle(Offset(-60, 240), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, 240), 10, completedcircle);

    //outer rogue sk4
    (boolpaint(builder.logic.character1.Path[4], 71))
        ? canvas.drawLine(Offset(-60, 240), Offset(0, 280), paintcircle)
        : canvas.drawLine(Offset(-60, 240), Offset(0, 280), completedcircle);
    (boolpaint(builder.logic.character1.Path[4], 75))
        ? canvas.drawCircle(Offset(0, 280), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 280), 10, completedcircle);

    //assassin sk1
    (boolpaint(builder.logic.character1.Path[5], 1))
        ? canvas.drawLine(Offset(0, 280), Offset(45, 315), paintcircle)
        : canvas.drawLine(Offset(0, 280), Offset(45, 315), completedcircle);
    (boolpaint(builder.logic.character1.Path[5], 10))
        ? canvas.drawCircle(Offset(45, 315), 10, paintcircle)
        : canvas.drawCircle(Offset(45, 315), 10, completedcircle);

    //assassin sk2
    (boolpaint(builder.logic.character1.Path[5], 11))
        ? canvas.drawLine(Offset(45, 315), Offset(60, 355), paintcircle)
        : canvas.drawLine(Offset(45, 315), Offset(60, 355), completedcircle);
    (boolpaint(builder.logic.character1.Path[5], 20))
        ? canvas.drawCircle(Offset(60, 355), 10, paintcircle)
        : canvas.drawCircle(Offset(60, 355), 10, completedcircle);

    //assassin sk3
    (boolpaint(builder.logic.character1.Path[5], 21))
        ? canvas.drawLine(Offset(60, 355), Offset(55, 395), paintcircle)
        : canvas.drawLine(Offset(60, 355), Offset(55, 395), completedcircle);
    (boolpaint(builder.logic.character1.Path[5], 25))
        ? canvas.drawCircle(Offset(55, 395), 10, paintcircle)
        : canvas.drawCircle(Offset(55, 395), 10, completedcircle);

    //ranger sk1
    (boolpaint(builder.logic.character1.Path[6], 1))
        ? canvas.drawLine(Offset(0, 280), Offset(-45, 315), paintcircle)
        : canvas.drawLine(Offset(0, 280), Offset(-45, 315), completedcircle);
    (boolpaint(builder.logic.character1.Path[6], 10))
        ? canvas.drawCircle(Offset(-45, 315), 10, paintcircle)
        : canvas.drawCircle(Offset(-45, 315), 10, completedcircle);

    //ranger sk2
    (boolpaint(builder.logic.character1.Path[6], 11))
        ? canvas.drawLine(Offset(-45, 315), Offset(-60, 355), paintcircle)
        : canvas.drawLine(Offset(-45, 315), Offset(-60, 355), completedcircle);
    (boolpaint(builder.logic.character1.Path[6], 20))
        ? canvas.drawCircle(Offset(-60, 355), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, 355), 10, completedcircle);

    //ranger sk3
    (boolpaint(builder.logic.character1.Path[6], 21))
        ? canvas.drawLine(Offset(-60, 355), Offset(-55, 395), paintcircle)
        : canvas.drawLine(Offset(-60, 355), Offset(-55, 395), completedcircle);
    (boolpaint(builder.logic.character1.Path[6], 25))
        ? canvas.drawCircle(Offset(-55, 395), 10, paintcircle)
        : canvas.drawCircle(Offset(-55, 395), 10, completedcircle);

    //=====================OUTER WARRIOR======================

    //outer warrior sk1
    (boolpaint(builder.logic.character1.Path[0], 51))
        ? canvas.drawLine(Offset(210.0, -125), Offset(240.0, -65), paintcircle)
        : canvas.drawLine(
            Offset(210.0, -125), Offset(240.0, -65), completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 60))
        ? canvas.drawCircle(Offset(185.0, -175), 10, paintcircle)
        : canvas.drawCircle(Offset(185.0, -175), 10, completedcircle);

    //outer warrior sk2
    (boolpaint(builder.logic.character1.Path[0], 61))
        ? canvas.drawLine(Offset(185.0, -175), Offset(210.0, -125), paintcircle)
        : canvas.drawLine(
            Offset(185.0, -175), Offset(210.0, -125), completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 65))
        ? canvas.drawCircle(Offset(210.0, -125), 10, paintcircle)
        : canvas.drawCircle(Offset(210.0, -125), 10, completedcircle);

    //outer warrior sk3
    (boolpaint(builder.logic.character1.Path[0], 66))
        ? canvas.drawLine(
            Offset(circlesize - 25, 0 - 95), Offset(185.0, -175), paintcircle)
        : canvas.drawLine(Offset(circlesize - 25, 0 - 95), Offset(185.0, -175),
            completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 70))
        ? canvas.drawCircle(Offset(240.0, -65), 10, paintcircle)
        : canvas.drawCircle(Offset(240.0, -65), 10, completedcircle);

    //outer warrior sk4
    (boolpaint(builder.logic.character1.Path[0], 71))
        ? canvas.drawLine(Offset(240.0, -65), Offset(245.0, -148), paintcircle)
        : canvas.drawLine(
            Offset(240.0, -65), Offset(245.0, -148), completedcircle);
    (boolpaint(builder.logic.character1.Path[0], 75))
        ? canvas.drawCircle(Offset(245.0, -148), 10, paintcircle)
        : canvas.drawCircle(Offset(245.0, -148), 10, completedcircle);

    //zerker sk1
    (boolpaint(builder.logic.character1.Path[1], 1))
        ? canvas.drawLine(Offset(245.0, -148), Offset(285.0, -132), paintcircle)
        : canvas.drawLine(
            Offset(245.0, -148), Offset(285.0, -132), completedcircle);
    (boolpaint(builder.logic.character1.Path[1], 10))
        ? canvas.drawCircle(Offset(285.0, -132), 10, paintcircle)
        : canvas.drawCircle(Offset(285.0, -132), 10, completedcircle);

    //zerker sk2
    (boolpaint(builder.logic.character1.Path[1], 11))
        ? canvas.drawLine(Offset(285.0, -132), Offset(325.0, -134), paintcircle)
        : canvas.drawLine(
            Offset(285.0, -132), Offset(325.0, -134), completedcircle);
    (boolpaint(builder.logic.character1.Path[1], 20))
        ? canvas.drawCircle(Offset(325.0, -134), 10, paintcircle)
        : canvas.drawCircle(Offset(325.0, -134), 10, completedcircle);

    //zerker sk3
    (boolpaint(builder.logic.character1.Path[1], 21))
        ? canvas.drawLine(Offset(325.0, -134), Offset(365.0, -155), paintcircle)
        : canvas.drawLine(
            Offset(325.0, -134), Offset(365.0, -155), completedcircle);
    (boolpaint(builder.logic.character1.Path[1], 25))
        ? canvas.drawCircle(Offset(365.0, -155), 10, paintcircle)
        : canvas.drawCircle(Offset(365.0, -155), 10, completedcircle);

    //warden sk1
    (boolpaint(builder.logic.character1.Path[2], 1))
        ? canvas.drawLine(Offset(245.0, -148), Offset(270.0, -185), paintcircle)
        : canvas.drawLine(
            Offset(245.0, -148), Offset(270.0, -185), completedcircle);
    (boolpaint(builder.logic.character1.Path[2], 10))
        ? canvas.drawCircle(Offset(270.0, -185), 10, paintcircle)
        : canvas.drawCircle(Offset(270.0, -185), 10, completedcircle);

    //warden sk2
    (boolpaint(builder.logic.character1.Path[2], 11))
        ? canvas.drawLine(Offset(270.0, -185), Offset(300.0, -210), paintcircle)
        : canvas.drawLine(
            Offset(270.0, -185), Offset(300.0, -210), completedcircle);
    (boolpaint(builder.logic.character1.Path[2], 20))
        ? canvas.drawCircle(Offset(300.0, -210), 10, paintcircle)
        : canvas.drawCircle(Offset(300.0, -210), 10, completedcircle);

    //warden sk3
    (boolpaint(builder.logic.character1.Path[2], 21))
        ? canvas.drawLine(Offset(300.0, -210), Offset(340.0, -225), paintcircle)
        : canvas.drawLine(
            Offset(300.0, -210), Offset(340.0, -225), completedcircle);
    (boolpaint(builder.logic.character1.Path[2], 25))
        ? canvas.drawCircle(Offset(340.0, -225), 10, paintcircle)
        : canvas.drawCircle(Offset(340.0, -225), 10, completedcircle);

    //==================END OF THE OUTER WARRIOR MAGE AND ROGUE============

    //===============BARD MONK AND GUARDIAN=============

    //===================BARD===================

    //bard sk1
    (boolpaint(builder.logic.character1.Path[7], 1))
        ? canvas.drawLine(
            Offset(-circlesize + 25, 0 + 95), Offset(-185, 170), paintcircle)
        : canvas.drawLine(Offset(-circlesize + 25, 0 + 95), Offset(-185, 170),
            completedcircle);
    (boolpaint(builder.logic.character1.Path[7], 10))
        ? canvas.drawCircle(Offset(-185, 170), 10, paintcircle)
        : canvas.drawCircle(Offset(-185, 170), 10, completedcircle);

    //bard sk2
    (boolpaint(builder.logic.character1.Path[7], 11))
        ? canvas.drawLine(Offset(-185, 170), Offset(-215, 120), paintcircle)
        : canvas.drawLine(
            Offset(-185, 170), Offset(-215, 120), completedcircle);
    (boolpaint(builder.logic.character1.Path[7], 15))
        ? canvas.drawCircle(Offset(-215, 120), 10, paintcircle)
        : canvas.drawCircle(Offset(-215, 120), 10, completedcircle);

    //bard sk3
    (boolpaint(builder.logic.character1.Path[7], 16))
        ? canvas.drawLine(Offset(-215, 120), Offset(-245, 70), paintcircle)
        : canvas.drawLine(Offset(-215, 120), Offset(-245, 70), completedcircle);
    (boolpaint(builder.logic.character1.Path[7], 20))
        ? canvas.drawCircle(Offset(-245, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(-245, 70), 10, completedcircle);

    //bard sk4
    (boolpaint(builder.logic.character1.Path[7], 21))
        ? canvas.drawLine(Offset(-245, 70), Offset(-255, 140), paintcircle)
        : canvas.drawLine(Offset(-245, 70), Offset(-255, 140), completedcircle);
    (boolpaint(builder.logic.character1.Path[7], 25))
        ? canvas.drawCircle(Offset(-255, 140), 10, paintcircle)
        : canvas.drawCircle(Offset(-255, 140), 10, completedcircle);

    //bard sk5
    (boolpaint(builder.logic.character1.Path[7], 26))
        ? canvas.drawLine(Offset(-255, 140), Offset(-285, 160), paintcircle)
        : canvas.drawLine(
            Offset(-255, 140), Offset(-285, 160), completedcircle);
    (boolpaint(builder.logic.character1.Path[7], 35))
        ? canvas.drawCircle(Offset(-285, 160), 10, paintcircle)
        : canvas.drawCircle(Offset(-285, 160), 10, completedcircle);

    //bard sk6
    (boolpaint(builder.logic.character1.Path[7], 36))
        ? canvas.drawLine(Offset(-285, 160), Offset(-315, 180), paintcircle)
        : canvas.drawLine(
            Offset(-285, 160), Offset(-315, 180), completedcircle);
    (boolpaint(builder.logic.character1.Path[7], 45))
        ? canvas.drawCircle(Offset(-315, 180), 10, paintcircle)
        : canvas.drawCircle(Offset(-315, 180), 10, completedcircle);

    //bard sk7
    (boolpaint(builder.logic.character1.Path[7], 46))
        ? canvas.drawLine(Offset(-285, 160), Offset(-345, 200), paintcircle)
        : canvas.drawLine(
            Offset(-285, 160), Offset(-345, 200), completedcircle);
    (boolpaint(builder.logic.character1.Path[7], 50))
        ? canvas.drawCircle(Offset(-345, 200), 10, paintcircle)
        : canvas.drawCircle(Offset(-345, 200), 10, completedcircle);

    //======================MONK======================

    //monk sk3
    (boolpaint(builder.logic.character1.Path[3], 16))
        ? canvas.drawLine(
            Offset(circlesize - 25, 0 + 95), Offset(245, 70), paintcircle)
        : canvas.drawLine(
            Offset(circlesize - 25, 0 + 95), Offset(245, 70), completedcircle);
    (boolpaint(builder.logic.character1.Path[3], 20))
        ? canvas.drawCircle(Offset(185, 170), 10, paintcircle)
        : canvas.drawCircle(Offset(185, 170), 10, completedcircle);

    //monk sk2
    (boolpaint(builder.logic.character1.Path[3], 11))
        ? canvas.drawLine(Offset(185, 170), Offset(215, 120), paintcircle)
        : canvas.drawLine(Offset(185, 170), Offset(215, 120), completedcircle);
    (boolpaint(builder.logic.character1.Path[3], 15))
        ? canvas.drawCircle(Offset(215, 120), 10, paintcircle)
        : canvas.drawCircle(Offset(215, 120), 10, completedcircle);

    //monk sk1
    (boolpaint(builder.logic.character1.Path[3], 1))
        ? canvas.drawLine(Offset(215, 120), Offset(245, 70), paintcircle)
        : canvas.drawLine(Offset(215, 120), Offset(245, 70), completedcircle);
    (boolpaint(builder.logic.character1.Path[3], 10))
        ? canvas.drawCircle(Offset(245, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(245, 70), 10, completedcircle);

    //monk sk4
    (boolpaint(builder.logic.character1.Path[3], 21))
        ? canvas.drawLine(Offset(185, 170), Offset(255, 140), paintcircle)
        : canvas.drawLine(Offset(185, 170), Offset(255, 140), completedcircle);
    (boolpaint(builder.logic.character1.Path[3], 25))
        ? canvas.drawCircle(Offset(255, 140), 10, paintcircle)
        : canvas.drawCircle(Offset(255, 140), 10, completedcircle);

    //monk sk5
    (boolpaint(builder.logic.character1.Path[3], 26))
        ? canvas.drawLine(Offset(255, 140), Offset(285, 160), paintcircle)
        : canvas.drawLine(Offset(255, 140), Offset(285, 160), completedcircle);
    (boolpaint(builder.logic.character1.Path[3], 35))
        ? canvas.drawCircle(Offset(285, 160), 10, paintcircle)
        : canvas.drawCircle(Offset(285, 160), 10, completedcircle);

    //monk sk6
    (boolpaint(builder.logic.character1.Path[3], 36))
        ? canvas.drawLine(Offset(285, 160), Offset(315, 180), paintcircle)
        : canvas.drawLine(Offset(285, 160), Offset(315, 180), completedcircle);
    (boolpaint(builder.logic.character1.Path[3], 45))
        ? canvas.drawCircle(Offset(315, 180), 10, paintcircle)
        : canvas.drawCircle(Offset(315, 180), 10, completedcircle);

    //monk sk7
    (boolpaint(builder.logic.character1.Path[3], 46))
        ? canvas.drawLine(Offset(285, 160), Offset(345, 200), paintcircle)
        : canvas.drawLine(Offset(285, 160), Offset(345, 200), completedcircle);
    (boolpaint(builder.logic.character1.Path[3], 50))
        ? canvas.drawCircle(Offset(345, 200), 10, paintcircle)
        : canvas.drawCircle(Offset(345, 200), 10, completedcircle);

    //=====================GUARDIAN========================

    //guardian sk1
    (boolpaint(builder.logic.character1.Path[11], 1))
        ? canvas.drawLine(Offset(0, 0 - 200), Offset(-60, -240), paintcircle)
        : canvas.drawLine(
            Offset(0, 0 - 200), Offset(-60, -240), completedcircle);
    (boolpaint(builder.logic.character1.Path[11], 10))
        ? canvas.drawCircle(Offset(-60, -240), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, -240), 10, completedcircle);

    //guardian sk2
    (boolpaint(builder.logic.character1.Path[11], 11))
        ? canvas.drawLine(Offset(-60, -240), Offset(0, -240), paintcircle)
        : canvas.drawLine(Offset(-60, -240), Offset(0, -240), completedcircle);
    (boolpaint(builder.logic.character1.Path[11], 15))
        ? canvas.drawCircle(Offset(0, -240), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -240), 10, completedcircle);

    //guardian sk3
    (boolpaint(builder.logic.character1.Path[11], 16))
        ? canvas.drawLine(Offset(0, -240), Offset(60, -240), paintcircle)
        : canvas.drawLine(Offset(0, -240), Offset(60, -240), completedcircle);
    (boolpaint(builder.logic.character1.Path[11], 20))
        ? canvas.drawCircle(Offset(60, -240), 10, paintcircle)
        : canvas.drawCircle(Offset(60, -240), 10, completedcircle);

    //guardian sk4
    (boolpaint(builder.logic.character1.Path[11], 21))
        ? canvas.drawLine(Offset(60, -240), Offset(0, -280), paintcircle)
        : canvas.drawLine(Offset(60, -240), Offset(0, -280), completedcircle);
    (boolpaint(builder.logic.character1.Path[11], 25))
        ? canvas.drawCircle(Offset(0, -280), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -280), 10, completedcircle);

    //guardian sk5
    (boolpaint(builder.logic.character1.Path[11], 26))
        ? canvas.drawLine(Offset(0, -280), Offset(0, -320), paintcircle)
        : canvas.drawLine(Offset(0, -280), Offset(0, -320), completedcircle);
    (boolpaint(builder.logic.character1.Path[11], 35))
        ? canvas.drawCircle(Offset(0, -320), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -320), 10, completedcircle);

    //guardian sk6
    (boolpaint(builder.logic.character1.Path[11], 36))
        ? canvas.drawLine(Offset(0, -320), Offset(0, -360), paintcircle)
        : canvas.drawLine(Offset(0, -320), Offset(0, -360), completedcircle);
    (boolpaint(builder.logic.character1.Path[11], 45))
        ? canvas.drawCircle(Offset(0, -360), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -360), 10, completedcircle);

    //guardian sk7
    (boolpaint(builder.logic.character1.Path[11], 46))
        ? canvas.drawLine(Offset(0, -360), Offset(0, -400), paintcircle)
        : canvas.drawLine(Offset(0, -360), Offset(0, -400), completedcircle);
    (boolpaint(builder.logic.character1.Path[11], 50))
        ? canvas.drawCircle(Offset(0, -400), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -400), 10, completedcircle);

    //=================MASTERY CIRCLE==================

    canvas.drawCircle(
        Offset(0, 0),
        20,
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 5);

    canvas.drawCircle(Offset(0, 0), circlesize, painthollow);
    (boolpaint(builder.logic.character1.Path[8], 50))
        ? canvas.drawCircle(Offset(-circlesize + 25, 0 - 95), 10, paintcircle)
        : canvas.drawCircle(
            Offset(-circlesize + 25, 0 - 95), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 50))
        ? canvas.drawCircle(Offset(circlesize - 25, 0 - 95), 10, paintcircle)
        : canvas.drawCircle(
            Offset(circlesize - 25, 0 - 95), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[11], 1))
        ? canvas.drawCircle(Offset(0, 0 - 200), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 0 - 200), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[7], 1))
        ? canvas.drawCircle(Offset(-circlesize + 25, 0 + 95), 10, paintcircle)
        : canvas.drawCircle(
            Offset(-circlesize + 25, 0 + 95), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[3], 1))
        ? canvas.drawCircle(Offset(circlesize - 25, 0 + 95), 10, paintcircle)
        : canvas.drawCircle(
            Offset(circlesize - 25, 0 + 95), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 50))
        ? canvas.drawCircle(Offset(0, 0 + 200), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 0 + 200), 10, completedcircle);
    //=================MASTERY CIRCLE==================

    //don't look here O.O

    (boolpaint(builder.logic.character1.Path[8], 1))
        ? canvas.drawCircle(Offset(-35, -85), 10, paintcircle)
        : canvas.drawCircle(Offset(-35, -85), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 5))
        ? canvas.drawCircle(Offset(-60, -30), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, -30), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 15))
        ? canvas.drawCircle(Offset(-85, 25), 10, paintcircle)
        : canvas.drawCircle(Offset(-85, 25), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 25))
        ? canvas.drawCircle(Offset(-95, -45), 10, paintcircle)
        : canvas.drawCircle(Offset(-95, -45), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 30))
        ? canvas.drawCircle(Offset(-103, -105), 10, paintcircle)
        : canvas.drawCircle(Offset(-103, -105), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 40))
        ? canvas.drawCircle(Offset(-140.0, -70), 10, paintcircle)
        : canvas.drawCircle(Offset(-140.0, -70), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 1))
        ? canvas.drawCircle(Offset(-60.0, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(-60.0, 70), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 5))
        ? canvas.drawCircle(Offset(0, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 70), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 15))
        ? canvas.drawCircle(Offset(60, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(60, 70), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 25))
        ? canvas.drawCircle(Offset(0, 110), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 110), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 30))
        ? canvas.drawCircle(Offset(-60, 150), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, 150), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 40))
        ? canvas.drawCircle(Offset(0, 150), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 150), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 1))
        ? canvas.drawCircle(Offset(0 + 75, 25), 10, paintcircle)
        : canvas.drawCircle(Offset(0 + 75, 25), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 5))
        ? canvas.drawCircle(Offset(60, -30), 10, paintcircle)
        : canvas.drawCircle(Offset(60, -30), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 15))
        ? canvas.drawCircle(Offset(45, -85), 10, paintcircle)
        : canvas.drawCircle(Offset(45, -85), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 25))
        ? canvas.drawCircle(Offset(105, -45), 10, paintcircle)
        : canvas.drawCircle(Offset(105, -45), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 30))
        ? canvas.drawCircle(Offset(165, -7), 10, paintcircle)
        : canvas.drawCircle(Offset(165, -7), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 40))
        ? canvas.drawCircle(Offset(140.0, -70), 10, paintcircle)
        : canvas.drawCircle(Offset(140.0, -70), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 60))
        ? canvas.drawCircle(Offset(-240.0, -65), 10, paintcircle)
        : canvas.drawCircle(Offset(-240.0, -65), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 65))
        ? canvas.drawCircle(Offset(-210.0, -125), 10, paintcircle)
        : canvas.drawCircle(Offset(-210.0, -125), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 70))
        ? canvas.drawCircle(Offset(-185.0, -175), 10, paintcircle)
        : canvas.drawCircle(Offset(-185.0, -175), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[8], 75))
        ? canvas.drawCircle(Offset(-245.0, -148), 10, paintcircle)
        : canvas.drawCircle(Offset(-245.0, -148), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[10], 10))
        ? canvas.drawCircle(Offset(-285.0, -132), 10, paintcircle)
        : canvas.drawCircle(Offset(-285.0, -132), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[10], 20))
        ? canvas.drawCircle(Offset(-325.0, -134), 10, paintcircle)
        : canvas.drawCircle(Offset(-325.0, -134), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[10], 25))
        ? canvas.drawCircle(Offset(-365.0, -155), 10, paintcircle)
        : canvas.drawCircle(Offset(-365.0, -155), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[9], 10))
        ? canvas.drawCircle(Offset(-270.0, -185), 10, paintcircle)
        : canvas.drawCircle(Offset(-270.0, -185), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[9], 20))
        ? canvas.drawCircle(Offset(-300.0, -210), 10, paintcircle)
        : canvas.drawCircle(Offset(-300.0, -210), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[9], 25))
        ? canvas.drawCircle(Offset(-340.0, -225), 10, paintcircle)
        : canvas.drawCircle(Offset(-340.0, -225), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 60))
        ? canvas.drawCircle(Offset(60, 240), 10, paintcircle)
        : canvas.drawCircle(Offset(60, 240), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 65))
        ? canvas.drawCircle(Offset(0, 240), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 240), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 70))
        ? canvas.drawCircle(Offset(-60, 240), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, 240), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[4], 75))
        ? canvas.drawCircle(Offset(0, 280), 10, paintcircle)
        : canvas.drawCircle(Offset(0, 280), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[5], 10))
        ? canvas.drawCircle(Offset(45, 315), 10, paintcircle)
        : canvas.drawCircle(Offset(45, 315), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[5], 20))
        ? canvas.drawCircle(Offset(60, 355), 10, paintcircle)
        : canvas.drawCircle(Offset(60, 355), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[5], 25))
        ? canvas.drawCircle(Offset(55, 395), 10, paintcircle)
        : canvas.drawCircle(Offset(55, 395), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[6], 10))
        ? canvas.drawCircle(Offset(-45, 315), 10, paintcircle)
        : canvas.drawCircle(Offset(-45, 315), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[6], 20))
        ? canvas.drawCircle(Offset(-60, 355), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, 355), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[6], 25))
        ? canvas.drawCircle(Offset(-55, 395), 10, paintcircle)
        : canvas.drawCircle(Offset(-55, 395), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 60))
        ? canvas.drawCircle(Offset(185.0, -175), 10, paintcircle)
        : canvas.drawCircle(Offset(185.0, -175), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 65))
        ? canvas.drawCircle(Offset(210.0, -125), 10, paintcircle)
        : canvas.drawCircle(Offset(210.0, -125), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 70))
        ? canvas.drawCircle(Offset(240.0, -65), 10, paintcircle)
        : canvas.drawCircle(Offset(240.0, -65), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[0], 75))
        ? canvas.drawCircle(Offset(245.0, -148), 10, paintcircle)
        : canvas.drawCircle(Offset(245.0, -148), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[1], 10))
        ? canvas.drawCircle(Offset(285.0, -132), 10, paintcircle)
        : canvas.drawCircle(Offset(285.0, -132), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[1], 20))
        ? canvas.drawCircle(Offset(325.0, -134), 10, paintcircle)
        : canvas.drawCircle(Offset(325.0, -134), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[1], 25))
        ? canvas.drawCircle(Offset(365.0, -155), 10, paintcircle)
        : canvas.drawCircle(Offset(365.0, -155), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[2], 10))
        ? canvas.drawCircle(Offset(270.0, -185), 10, paintcircle)
        : canvas.drawCircle(Offset(270.0, -185), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[2], 20))
        ? canvas.drawCircle(Offset(300.0, -210), 10, paintcircle)
        : canvas.drawCircle(Offset(300.0, -210), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[2], 25))
        ? canvas.drawCircle(Offset(340.0, -225), 10, paintcircle)
        : canvas.drawCircle(Offset(340.0, -225), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[7], 10))
        ? canvas.drawCircle(Offset(-185, 170), 10, paintcircle)
        : canvas.drawCircle(Offset(-185, 170), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[7], 15))
        ? canvas.drawCircle(Offset(-215, 120), 10, paintcircle)
        : canvas.drawCircle(Offset(-215, 120), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[7], 20))
        ? canvas.drawCircle(Offset(-245, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(-245, 70), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[7], 25))
        ? canvas.drawCircle(Offset(-255, 140), 10, paintcircle)
        : canvas.drawCircle(Offset(-255, 140), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[7], 35))
        ? canvas.drawCircle(Offset(-285, 160), 10, paintcircle)
        : canvas.drawCircle(Offset(-285, 160), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[7], 45))
        ? canvas.drawCircle(Offset(-315, 180), 10, paintcircle)
        : canvas.drawCircle(Offset(-315, 180), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[7], 50))
        ? canvas.drawCircle(Offset(-345, 200), 10, paintcircle)
        : canvas.drawCircle(Offset(-345, 200), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[3], 20))
        ? canvas.drawCircle(Offset(185, 170), 10, paintcircle)
        : canvas.drawCircle(Offset(185, 170), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[3], 15))
        ? canvas.drawCircle(Offset(215, 120), 10, paintcircle)
        : canvas.drawCircle(Offset(215, 120), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[3], 10))
        ? canvas.drawCircle(Offset(245, 70), 10, paintcircle)
        : canvas.drawCircle(Offset(245, 70), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[3], 25))
        ? canvas.drawCircle(Offset(255, 140), 10, paintcircle)
        : canvas.drawCircle(Offset(255, 140), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[3], 35))
        ? canvas.drawCircle(Offset(285, 160), 10, paintcircle)
        : canvas.drawCircle(Offset(285, 160), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[3], 45))
        ? canvas.drawCircle(Offset(315, 180), 10, paintcircle)
        : canvas.drawCircle(Offset(315, 180), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[3], 50))
        ? canvas.drawCircle(Offset(345, 200), 10, paintcircle)
        : canvas.drawCircle(Offset(345, 200), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[11], 10))
        ? canvas.drawCircle(Offset(-60, -240), 10, paintcircle)
        : canvas.drawCircle(Offset(-60, -240), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[11], 15))
        ? canvas.drawCircle(Offset(0, -240), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -240), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[11], 20))
        ? canvas.drawCircle(Offset(60, -240), 10, paintcircle)
        : canvas.drawCircle(Offset(60, -240), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[11], 25))
        ? canvas.drawCircle(Offset(0, -280), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -280), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[11], 35))
        ? canvas.drawCircle(Offset(0, -320), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -320), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[11], 45))
        ? canvas.drawCircle(Offset(0, -360), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -360), 10, completedcircle);

    (boolpaint(builder.logic.character1.Path[11], 50))
        ? canvas.drawCircle(Offset(0, -400), 10, paintcircle)
        : canvas.drawCircle(Offset(0, -400), 10, completedcircle);

    /*  final picture = pictureRecorder.endRecording();

    final imger = picture.toImage(size.width.floor(), size.height.floor());

    final imagetojpg = await imger;
    /* final pngimger = img.encodePngFile(
        'C:\\Users\\Marinbawe\\OneDrive\\pqbuilder\\assets', imagetojpg); */

    ByteData? byteimg =
        await imagetojpg.toByteData(format: ImageByteFormat.png);
    final thing =
        await File('tree.png').writeAsBytes(byteimg!.buffer.asUint8List());

    return byteimg.buffer.asUint8List().toString(); */

    //end of paintings
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      Canvas != oldDelegate;
}
