import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:pqbuilder/ui/theme.dart" as ui;

class GrenzeBorderText extends StatelessWidget {
  const GrenzeBorderText({
    Key? key,
    required this.text,
    this.borderWidth = 1.5,
    this.borderColor,
  }) : super(key: key);

  final Text text;
  final double borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Text(
          text.data ?? "",
          overflow: text.overflow,
          textAlign: text.textAlign,
          textDirection: text.textDirection,
          maxLines: text.maxLines,
          style: GoogleFonts.grenze(
            fontSize: text.style?.fontSize,
            fontWeight: text.style?.fontWeight,
            height: text.style?.height,
            decoration: text.style?.decoration,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = borderWidth
              ..color = borderColor ?? ui.Theme.darkDarkest,
          ),
        ),
        text,
      ],
    );
  }
}
