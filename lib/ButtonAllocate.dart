import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pqbuilder/grenze.dart';
import 'builder/builder.dart' as builder;
import "BorderText.dart";
import 'ui/theme.dart' as ui;
import 'PlayerStats.dart';

class ButtonAllocate extends StatefulWidget {
  const ButtonAllocate(
      {Key? key,
      required this.path,
      required this.width,
      required this.height,
      required this.Grad1,
      required this.Grad2,
      required this.name})
      : super(key: key);
  final int path;
  final String name;
  final double width;
  final double height;
  final Color Grad1, Grad2;

  @override
  State<ButtonAllocate> createState() => _ButtonAllocateState();
}

class _ButtonAllocateState extends State<ButtonAllocate> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = builder.logic.AffinityValues[widget.path];
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(widget.width + 0.06, widget.height - 1),
            child: BordersWidget(
              borderColor: LinearGradient(colors: [widget.Grad1, widget.Grad2]),
              child: Container(
                // height: MediaQuery.of(context).size.width * 0.29,
                width: MediaQuery.of(context).size.width * 0.22,
                child: GrenzeBorderText(
                  text: Text(widget.name,
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
            alignment: Alignment(widget.width + 0.32, widget.height + 0.1),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.04,
              child: TextButton(
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      _controller.text = "0";
                      builder.logic.setAffinity(
                          widget.path, int.parse(_controller.text));
                    }
                    if (builder.logic.character1.Affinity[widget.path] < 100) {
                      int rempoint = int.parse(_controller.text);
                      rempoint += 1;
                      builder.logic.setAffinity(widget.path, rempoint);
                      _controller.text = rempoint.toString();
                    }
                  },
                  child: Text(
                    "+1",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.green)),
            ),
          ),
          Align(
            alignment: Alignment(widget.width - 0.38, widget.height + 0.1),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.04,
              child: TextButton(
                  onPressed: () {
                    if (builder.logic.character1.Affinity[widget.path] > 0) {
                      int rempoint = int.parse(_controller.text);
                      rempoint -= 1;
                      builder.logic.setAffinity(widget.path, rempoint);
                      _controller.text = rempoint.toString();
                    }
                  },
                  child: Text(
                    "-1",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.red)),
            ),
          ),
          Align(
            alignment: Alignment(widget.width, widget.height + 0.1),
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
                      final int? points = int.tryParse(value);
                      builder.logic.AffinityValues[widget.path] =
                          _controller.text;
                      if (_controller.text.contains("-") ||
                          _controller.text.contains(".")) {
                        _controller.text = "";
                        builder.logic.setAffinity(widget.path, 0);

                        Fluttertoast.showToast(
                            msg: "Cannot add illegal characters.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM);
                      } else if (_controller.text == "" ||
                          int.parse(value) < 0) {
                        builder.logic.setAffinity(widget.path, 0);
                      } else if (int.parse(value) > 100) {
                        builder.logic.setAffinity(widget.path, 100);
                      } else {
                        builder.logic.setAffinity(widget.path, points);
                      }
                    },
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
      ),
    );
  }
}

/* Allocation(StatsUser MasteryPoint, double width, height, BuildContext context) {
  int amount = 0;
  return Stack(
    children: [
      Align(
        alignment: Alignment(width + 0.1, height),
        child: SizedBox(
          width: 35,
          height: 20,
          child: TextButton(
              onPressed: () {
                /*   Selector<BuilderLogic, StatsUser>(selector: (_, bL) {
                  return bL.MasteryValue(
                      MasteryPoint, MasteryPoint.Warrior + 1);
                }, builder: (context, value, child) {
                  return BuilderLogic()
                      .MasteryValue(MasteryPoint, MasteryPoint.Warrior + 1);
                }); */
              },
              child: Text(
                "+1",
                style: TextStyle(color: Colors.black),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green)),
        ),
      ),
      Align(
          alignment: Alignment(width, height),
          child: Container(
            width: 40,
            height: 20,
            child: Text(
              "$amount",
              style: TextStyle(color: Colors.white),
            ),
          )),
    ],
  );
} */
/* 
class Calcer extends StatelessWidget {
  Calcer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.read<BuilderLogic>().Calc}',
        key: Key('counterState'), style: Theme.of(context).textTheme.headline4);
  }
}

class MPoints extends StatelessWidget {
  MPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.read<BuilderLogic>().MasteryValue}',
        key: Key('counterState'), style: Theme.of(context).textTheme.headline4);
  }
}
 */