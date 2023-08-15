import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/grenze.dart';
import 'builder/builder.dart' as builder;
import "BorderText.dart";
import 'ui/theme.dart' as ui;

class AffinityNames extends StatelessWidget {
  const AffinityNames({
    Key? key,
    required this.path,
    required this.name,
    required this.width,
    required this.height,
    required this.Grad1,
    required this.Grad2,
  }) : super(key: key);
  final int path;
  final String name;
  final double width;
  final double height;
  final Color Grad1, Grad2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [],
    );
  }
}
/* Align(
          alignment: Alignment(width, height - 0.5),
          child: BordersWidget(
            borderColor: LinearGradient(colors: [Grad1, Grad2]),
            child: Container(
              // height: MediaQuery.of(context).size.width * 0.29,
              width: MediaQuery.of(context).size.width * 0.18,
              child: GrenzeBorderText(
                text: Text(name,
                    style: GoogleFonts.grenze(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                borderWidth: 3,
                borderColor: ui.Theme.darkDarkest,
              ),
            ),
          ),
        ), */
