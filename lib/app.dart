import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pqbuilder/BorderText.dart';
import 'package:pqbuilder/grenze.dart';
import 'Equipment.dart';
import 'package:pqbuilder/Equipmentfuncs.dart';
import 'package:pqbuilder/ButtonAllocate.dart';
import 'package:pqbuilder/Wiki.dart';
import 'package:tuple/tuple.dart';
import 'PlayerStats.dart';
import 'WikiWidgets/detailedinfo.dart';
import 'ui/theme.dart' as ui;
import 'ShowStats.dart';
import "package:provider/provider.dart";
import 'builder/builder.dart' as builder;
import 'textfieldpath.dart';
import 'ItemBox.dart';
import 'EleStats.dart';
import 'main.dart' as main;
import 'painter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import "package:google_sign_in/google_sign_in.dart";

class BuilderApp extends StatefulWidget {
  const BuilderApp({super.key});

  @override
  State<BuilderApp> createState() => _BuilderState();
}

void clearText(_controller) {
  _controller.clear();
}

StatsUser Character = new StatsUser();
final _controller = TextEditingController();

class _BuilderState extends State<BuilderApp> {
  bool Visible1 = true;
  bool Visible2 = false;
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return ChangeNotifierProvider.value(
      value: builder.logic,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: false,
        extendBodyBehindAppBar: false,
        appBar: AppBar(toolbarHeight: 42),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    "PQBuilder\nMade by Marinbawe",
                    style: GoogleFonts.grenze(fontSize: 20),
                  )),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.menu_book),
                    SizedBox(width: 50),
                    Text("Wiki"),
                  ],
                ),
                onTap: () {
                  builder.logic.ShowWidgetOnTop(Wiki());
                  Navigator.pop(context);

                  /*  builder.logic.ShowWidgetOnTop(Wiki());
                  Navigator.pop(context); */
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.account_tree),
                    SizedBox(width: 50),
                    Text("Allocation"),
                  ],
                ),
                onTap: () {
                  setState(() {
                    builder.logic.shown = false;
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        backgroundColor: ui.Theme.darkDarkest,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Opacity(
                opacity: 1,
                child: Align(
                  alignment: Alignment(0, 0),
                  child: PainterImg(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: ui.Theme.darkDarkest),
              ),
              /* Align(
                alignment: Alignment(-0.99, -0.3),
                child: BordersWidget(
                    child: IconButton(
                      onPressed: () async {
                        builder.logic.ShowWidgetOnTop(Wiki());
                      },
                      icon: Icon(Icons.menu_book),
                      color: Color.fromRGBO(235, 235, 235, 1),
                    ),
                    borderColor: LinearGradient(
                        colors: [Colors.teal, Colors.blue],
                        begin: Alignment.topCenter)),
              ), */
              Visibility(
                visible: Visible2,
                child: Align(
                    alignment: Alignment(0.99, -0.3),
                    child: BordersWidget(
                      borderColor: LinearGradient(
                          colors: [Colors.purple, Colors.deepOrange]),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: InkWell(
                              onTap: () async {
                                await screenshotController
                                    .capture(
                                        delay: const Duration(milliseconds: 10))
                                    .then((value) async {
                                  Uint8List image = await value!;
                                  final directory =
                                      await getApplicationDocumentsDirectory();
                                  /* final imagePath = await File(
                                            '${directory.path}/image.png')
                                        .create();
                                    await imagePath.writeAsBytes(image); */
                                  print(
                                      'done! check the image in ${directory.path}/PQBuilder${DateTime.now().microsecondsSinceEpoch}.png');

                                  if (image != null) {
                                    print("IT WORKED");
                                    final result =
                                        await ImageGallerySaver.saveImage(
                                      image,
                                      quality: 80,
                                      name: 'PQBuilder${DateTime.now()}',
                                    );
                                    Fluttertoast.showToast(
                                        msg: "Image saved in Gallery",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM);
                                  }
                                });

                                /* final directory =
                                      (await getTemporaryDirectory()).path;
                                  String fileName =
                                      '${DateTime.now().microsecondsSinceEpoch.toString()}.png';
                                  var path = '$directory';
        
                                  /* screenshotController
                                      .captureFromWidget(PainterImg())
                                      .then((value) => null); */
                                  screenshotController.captureAndSave(
                                    path,
                                    fileName: fileName,
                                  );
                                  print(
                                      'Done! check  ${await getTemporaryDirectory()}, with the name of $fileName'); */
                              },
                              child: GrenzeBorderText(
                                text: Text("Export",
                                    style: GoogleFonts.grenze(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.0304,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ))),
                    )),
              ),
              Align(
                  alignment: Alignment(0.99, -0.45),
                  child: BordersWidget(
                      borderColor: LinearGradient(colors: [
                        Color.fromRGBO(113, 0, 255, 1),
                        Color.fromRGBO(197, 0, 255, 1)
                      ]),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Visible1 = !Visible1;
                                Visible2 = !Visible2;
                                print(Visible1);
                              });
                            },
                            child: (Visible1 == true)
                                ? GrenzeBorderText(
                                    text: Text("To Items",
                                        style: GoogleFonts.grenze(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.0304,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )
                                : GrenzeBorderText(
                                    text: Text("To Allocation",
                                        style: GoogleFonts.grenze(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.0304,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                          )))),
              Visibility(
                visible: Visible1,
                child: Positioned(
                  left: 0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 12; i++)
                              Selector<builder.BuilderLogic, int>(
                                selector: (_, bl) => 0,
                                builder: (_, bl, __) {
                                  return TextFieldPath(
                                      pathname:
                                          builder.logic.character1.PathNames[i],
                                      path: i,
                                      width: 0.2,
                                      height: -0.4,
                                      Grad1: ui.Theme.PathGradient[i],
                                      Grad2: ui.Theme.PathGradientDark[i]);
                                },
                              ),
                          ]),
                    ),
                  ),
                ),
              ),
              Selector<builder.BuilderLogic,
                      Tuple2<List<Equipment>, Equipment>>(
                  selector: (_, bl) =>
                      Tuple2(main.SortedItems[6], builder.logic.Saver[6]),
                  builder: (_, bl, __) {
                    return Visibility(
                      visible: Visible2,
                      maintainState: true,
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
              Selector<builder.BuilderLogic,
                      Tuple2<List<Equipment>, Equipment>>(
                  selector: (_, bl) =>
                      Tuple2(main.SortedItems[0], builder.logic.Saver[0]),
                  builder: (_, bl, __) {
                    return Visibility(
                      visible: Visible2,
                      maintainState: true,
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
              Selector<builder.BuilderLogic,
                      Tuple2<List<Equipment>, Equipment>>(
                  selector: (_, bl) =>
                      Tuple2(main.SortedItems[1], builder.logic.Saver[1]),
                  builder: (_, bl, __) {
                    return Visibility(
                      visible: Visible2,
                      maintainState: true,
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
              Selector<builder.BuilderLogic,
                      Tuple2<List<Equipment>, Equipment>>(
                  selector: (_, bl) =>
                      Tuple2(main.SortedItems[2], builder.logic.Saver[2]),
                  builder: (_, bl, __) {
                    return Visibility(
                      visible: Visible2,
                      maintainState: true,
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
              Selector<builder.BuilderLogic,
                      Tuple2<List<Equipment>, Equipment>>(
                  selector: (_, bl) =>
                      Tuple2(main.SortedItems[3], builder.logic.Saver[3]),
                  builder: (_, bl, __) {
                    return Visibility(
                      visible: Visible2,
                      maintainState: true,
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
              Selector<builder.BuilderLogic,
                      Tuple2<List<Equipment>, Equipment>>(
                  selector: (_, bl) =>
                      Tuple2(main.SortedItems[4], builder.logic.Saver[4]),
                  builder: (_, bl, __) {
                    return Visibility(
                      visible: Visible2,
                      maintainState: true,
                      child: Align(
                          alignment: Alignment(-0.5, -0.7),
                          child: ItemBox(
                            currentItem: builder.logic.Saver[4],
                            database: main.SortedItems[4],
                            category: 4,
                            height: 0,
                            width: 0.615,
                          )),
                    );
                  }),
              Selector<builder.BuilderLogic,
                      Tuple2<List<Equipment>, Equipment>>(
                  selector: (_, bl) =>
                      Tuple2(main.SortedItems[5], builder.logic.Saver[5]),
                  builder: (_, bl, __) {
                    return Visibility(
                      visible: Visible2,
                      maintainState: true,
                      child: Align(
                          alignment: Alignment(-0.5, -0.7),
                          child: ItemBox(
                            currentItem: builder.logic.Saver[5],
                            database: main.SortedItems[5],
                            category: 5,
                            height: 0,
                            width: 1,
                          )),
                    );
                  }),
              Visibility(
                visible: Visible1,
                child: Positioned(
                  top: MediaQuery.of(context).size.height * 0.37,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 4; i++)
                              Selector<builder.BuilderLogic, int>(
                                selector: (_, bl) => 0,
                                builder: (_, bl, __) {
                                  return ButtonAllocate(
                                    path: i,
                                    width: 0.6,
                                    height: -0.5,
                                    Grad1: ui.Theme.AffinityGradient[i],
                                    Grad2: ui.Theme.AffinityDark[i],
                                    name: builder
                                        .logic.character1.AffinityNames[i],
                                  );
                                },
                              ),
                          ]),
                    ),
                  ),
                ),
              ),
              /* build changer
              Align(
                alignment: Alignment(0.8, 0.75),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.17,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      color: ui.Theme.darkDarkest,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Color.fromRGBO(155, 155, 155, 1))),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    value: builder.logic.buildnames[1],
                    items: builder.logic.buildnames
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: GrenzeBorderText(
                            text: Text(
                              value,
                              style: GoogleFonts.grenze(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  color: Colors.white),
                              textAlign: TextAlign.right,
                            ),
                          ));
                    }).toList(),
                    onChanged: (String? value) {},
                  )),
                ),
              ), */
              Align(
                alignment: Alignment(0.2, -0.85),
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
              Selector<builder.BuilderLogic, Tuple2<Widget, bool>>(
                  selector: (_, bl) =>
                      Tuple2(builder.logic.widgetsaver, builder.logic.shown),
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
        ),
      ),
    );
  }
}
