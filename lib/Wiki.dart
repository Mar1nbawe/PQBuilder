import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'ui/theme.dart' as ui;
import 'builder/builder.dart' as builder;
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wikiparsers.dart';

class Wiki extends StatefulWidget {
  Wiki({Key? key}) : super(key: key);

  @override
  _WikiState createState() => _WikiState();
}

class _WikiState extends State<Wiki> {
  @override
  Widget build(BuildContext context) {
    String radiovalue = "Monsters";
    List<Foods> WikiDatabase;

    return Container(
      color: ui.Theme.darkDarkest,
      child: Stack(
        children: [
          Align(
              child: Align(
                  alignment: Alignment(0, -1.081),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromRGBO(40, 66, 98, 1),
                      Color.fromRGBO(46, 67, 92, 1)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(1, -0.8),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 1,
                            width: MediaQuery.of(context).size.width,
                            child: CustomRadioButton(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.45,
                                defaultSelected: radiovalue,
                                margin: EdgeInsets.all(5),
                                buttonTextStyle: ButtonTextStyle(
                                    textStyle: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035),
                                    unSelectedColor: Colors.white,
                                    selectedColor: Colors.orange),
                                spacing: 0,
                                elevation: 15,
                                shapeRadius: 75,
                                radius: 10,
                                horizontal: false,
                                unSelectedBorderColor: Colors.white,
                                selectedBorderColor: Colors.amber,
                                buttonLables: [
                                  "Monsters",
                                  "Foods",
                                ],
                                buttonValues: [
                                  "Monsters",
                                  "Foods",
                                ],
                                radioButtonValue: (value) {
                                  setState(() {
                                    if (value == "Monsters")
                                      builder.logic.buttonvaluevis = 1;
                                    else if (value == "Foods")
                                      builder.logic.buttonvaluevis = 2;
                                    else if (value == "Dungeon Keepers")
                                      builder.logic.buttonvaluevis = 3;
                                    else
                                      builder.logic.buttonvaluevis = 4;
                                  });

                                  /*  WikiDatabase.forEach((element) {
                                    print(element.name);
                                    print(element.resource.map((e) {
                                      return e;
                                    }));
                                    print(element.stats.map((element) {
                                      return element.statValue;
                                    }));
                                    print("===============");
                                  }); */
                                  /* WikiDatabase.sort(
                                    (a, b) {
                                      return a.gradient.compareTo(b.gradient);
                                    },
                                  ); */

                                  /* if (value == "Foods") {
                                    List<Foods> stuff = convertFood(maker);
                                    print(stuff.toList());
                                  } */
                                },
                                unSelectedColor: Colors.transparent,
                                selectedColor: Colors.transparent),
                          ),
                        ),
                      ],
                    ),
                  ))),
          Selector<builder.BuilderLogic, List<Widget>>(
            selector: (_, bl) => [],
            builder: (_, bl, __) {
              return Align(
                alignment: Alignment(0, 1),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.83,
                  child: SingleChildScrollView(
                    child: Stack(children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                  children: builder.logic.WikiWidget(
                                      context, builder.logic.buttonvaluevis))
                            ],
                          )),
                    ]),
                  ),
                ),
              );
            },
          ),
          Selector<builder.BuilderLogic, Tuple2<Widget, bool>>(
              selector: (_, bl) => Tuple2(
                  builder.logic.detailedsaver, builder.logic.detailedvisible),
              builder: (_, bl, ___) {
                return IgnorePointer(
                    ignoring: false,
                    child: SafeArea(
                      top: false,
                      minimum: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.032),
                      bottom: true,
                      child: Visibility(
                        visible: bl.item2,
                        child: bl.item1,
                      ),
                    ));
              }),
        ],
      ),
    );
  }
}
