import 'package:flutter/material.dart';

class Theme {
  static const Color darkDarkest = Color.fromARGB(255, 20, 20, 20);

  static const List<Color> PathGradient = [
    Colors.red,
    Colors.red,
    Colors.red,
    Colors.deepOrange,
    Color.fromRGBO(253, 229, 65, 1),
    Color.fromRGBO(253, 229, 65, 1),
    Color.fromRGBO(253, 229, 65, 1),
    Colors.green,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.deepPurple,
  ];

  static const List<Color> PathGradientDark = [
    Colors.red,
    Colors.red,
    Colors.red,
    Colors.orange,
    Color.fromRGBO(253, 229, 65, 1),
    Color.fromRGBO(253, 229, 65, 1),
    Color.fromRGBO(253, 229, 65, 1),
    Colors.lightGreen,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.purple,
  ];

  static const List<Color> AffinityGradient = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Color.fromRGBO(253, 229, 65, 1),
  ];
  static const List<Color> AffinityDark = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Color.fromRGBO(253, 229, 65, 1),
  ];

  static const List<Color> EleGradient = [
    Colors.green,
    Colors.blue,
    Color.fromRGBO(253, 229, 65, 1),
    Colors.red,
  ];

  static const List<List<Color>> FloorGradients = [
    [Colors.white, Color.fromRGBO(233, 117, 10, 1)],
    [Colors.white, Color.fromRGBO(233, 117, 10, 1)],
    [Colors.white, Color.fromRGBO(167, 167, 167, 1)],
    [Colors.white, Color.fromRGBO(167, 167, 167, 1)],
    [
      Colors.white,
      Color.fromRGBO(255, 215, 0, 1),
      Color.fromRGBO(255, 215, 0, 1),
      Colors.black
    ],
    [
      Colors.white,
      Color.fromRGBO(255, 215, 0, 1),
      Color.fromRGBO(255, 215, 0, 1),
      Color.fromRGBO(0, 0, 0, 0.8)
    ],
    [Colors.white, Color.fromRGBO(8, 143, 143, 1)],
    [Colors.white, Color.fromRGBO(8, 143, 143, 1)],
    [
      Colors.white,
      Colors.white,
      Color.fromRGBO(191, 64, 191, 1),
      Color.fromRGBO(120, 0, 255, 1)
    ]
  ];

  static const List<List<Color>> FoodGradients = [
    [Colors.white, Color.fromRGBO(233, 117, 10, 1)],
    [Colors.white, Color.fromRGBO(167, 167, 167, 1)],
    [
      Colors.white,
      Color.fromRGBO(255, 215, 0, 1),
      Color.fromRGBO(255, 195, 0, 1),
    ],
    [Colors.white, Color.fromRGBO(8, 143, 143, 1)],
    [
      Colors.white,
      Colors.white,
      Color.fromRGBO(191, 64, 191, 1),
      Color.fromRGBO(120, 0, 255, 1)
    ]
  ];

  static const List<List<Color>> BoxColors = [
    [Color.fromRGBO(69, 30, 172, 1), Color.fromRGBO(74, 63, 153, 1)],
    [Color.fromRGBO(74, 63, 153, 1), Color.fromRGBO(85, 93, 177, 1)],
    [Color.fromRGBO(88, 109, 166, 1), Color.fromRGBO(73, 146, 193, 1)],
    [Color.fromRGBO(90, 144, 178, 1), Color.fromRGBO(73, 193, 190, 1)],
    [Color.fromRGBO(95, 190, 188, 1), Color.fromRGBO(81, 229, 195, 1)]
  ];
}
