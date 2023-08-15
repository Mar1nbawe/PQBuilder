import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/ui/theme.dart' as ui;

class BordersWidget extends StatelessWidget {
  const BordersWidget({
    Key? key,
    required this.child,
    this.borderWidth = 1.5,
    required this.borderColor,
  }) : super(key: key);

  final Widget child;
  final double? borderWidth;
  final LinearGradient borderColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: sort_child_properties_last
      children: [
        Container(
            decoration: BoxDecoration(
              gradient: borderColor,
              border: Border.all(
                color: ui.Theme.darkDarkest,
              ),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                  padding: EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(20, 20, 20, 0.75),
                    ),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: child),
            ))
      ],
      alignment: Alignment.center,
      clipBehavior: Clip.none,
    );
  }
}

final BorderDeco = BoxDecoration(
  gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
  border: Border.all(
    color: ui.Theme.darkDarkest,
  ),
  borderRadius: BorderRadius.circular(60),
);
