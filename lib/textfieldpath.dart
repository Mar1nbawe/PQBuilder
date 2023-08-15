import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pqbuilder/BorderText.dart';
import 'builder/builder.dart' as builder;
import 'package:pqbuilder/ui/theme.dart' as ui;
import "grenze.dart";
import 'package:google_fonts/google_fonts.dart';

class TextFieldPath extends StatefulWidget {
  TextFieldPath({
    Key? key,
    required this.pathname,
    required this.path,
    required this.width,
    required this.height,
    required this.Grad1,
    required this.Grad2,
  }) : super(key: key);
  final String pathname;
  final int path;
  final double width;
  final double height;
  final Color Grad1, Grad2;

  @override
  State<TextFieldPath> createState() => _TextFieldPathState();
}

void clearText(_controller) {
  _controller.clear();
}

class _TextFieldPathState extends State<TextFieldPath> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text =
        _controller.text = builder.logic.ControllerValues[widget.path];
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    return Stack(
      children: [
        Align(
          alignment: Alignment(widget.height - 0.5, widget.width),
          child: BordersWidget(
            borderColor: LinearGradient(colors: [widget.Grad1, widget.Grad2]),
            child: Container(
              // height: MediaQuery.of(context).size.width * 0.29,
              width: MediaQuery.of(context).size.width * 0.22,
              child: GrenzeBorderText(
                text: Text(widget.pathname,
                    style: GoogleFonts.grenze(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                borderWidth: 3,
                borderColor: ui.Theme.darkDarkest,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(widget.height + 0.1, widget.width),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.16,
            height: MediaQuery.of(context).size.height * 0.04,
            child: Container(
              child: TextField(
                  maxLength: 3,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: InputBorder.none,
                  ),
                  controller: _controller,
                  onChanged: (String value) {
                    final double? points = double.tryParse(value);
                    /*
                       else {
                        final int? points = int.tryParse(value);
                        builder.logic.setAffinity(widget.path, points);
                      }
                    */
                    builder.logic.ControllerValues[widget.path] =
                        _controller.text;
                    if (_controller.text.contains("-") ||
                        _controller.text.contains(".")) {
                      _controller.clear();
                      builder.logic.setMastery(widget.path, 0);

                      Fluttertoast.showToast(
                          msg: "Cannot add illegal characters.",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM);
                    }
                    if (_controller.text == "" || points! < 0) {
                      builder.logic.setMastery(widget.path, 0.0);
                    } else if (int.parse(value) > 100) {
                      builder.logic.setMastery(widget.path, 100.0);
                      _controller.text = "100";
                    } else {
                      builder.logic.setMastery(widget.path, points);
                    }
                  },
                  scrollPadding: EdgeInsets.only(bottom: 50),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
