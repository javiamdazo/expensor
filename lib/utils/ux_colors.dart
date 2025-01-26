import 'package:flutter/material.dart';

enum UxColors {
  turquoise,
  emerald,
  peterRiver,
  amethyst,
  wetAsphalt,
  greenSea,
  nephritis,
  belizeHole,
  wisteria,
  midnightBlue,
  sunFlower,
  carrot,
  alizarin,
  clouds,
  concrete,
  orange,
  pumpkin,
  pomegranate,
  silver,
  asbestos,
  dark,
  darkLight,
  darkLightSmooth;

  Color get value {
    switch (this) {
      case UxColors.turquoise:
        return const Color.fromRGBO(26, 188, 156, 1.0);
      case UxColors.emerald:
        return const Color.fromRGBO(46, 204, 113, 1.0);
      case UxColors.peterRiver:
        return const Color.fromRGBO(52, 152, 219, 1.0);
      case UxColors.amethyst:
        return const Color.fromRGBO(155, 89, 182, 1.0);
      case UxColors.wetAsphalt:
        return const Color.fromRGBO(52, 73, 94, 1.0);
      case UxColors.greenSea:
        return const Color.fromRGBO(22, 160, 133, 1.0);
      case UxColors.nephritis:
        return const Color.fromRGBO(39, 174, 96, 1.0);
      case UxColors.belizeHole:
        return const Color.fromRGBO(41, 128, 185, 1.0);
      case UxColors.wisteria:
        return const Color.fromRGBO(142, 68, 173, 1.0);
      case UxColors.midnightBlue:
        return const Color.fromRGBO(44, 62, 80, 1.0);
      case UxColors.sunFlower:
        return const Color.fromRGBO(241, 196, 15, 1.0);
      case UxColors.carrot:
        return const Color.fromRGBO(230, 126, 34, 1.0);
      case UxColors.alizarin:
        return const Color.fromRGBO(231, 76, 60, 1.0);
      case UxColors.clouds:
        return const Color.fromRGBO(236, 240, 241, 1.0);
      case UxColors.concrete:
        return const Color.fromRGBO(149, 165, 166, 1.0);
      case UxColors.orange:
        return const Color.fromRGBO(243, 156, 18, 1.0);
      case UxColors.pumpkin:
        return const Color.fromRGBO(211, 84, 0, 1.0);
      case UxColors.pomegranate:
        return const Color.fromRGBO(192, 57, 43, 1.0);
      case UxColors.silver:
        return const Color.fromRGBO(189, 195, 199, 1.0);
      case UxColors.asbestos:
        return const Color.fromRGBO(127, 140, 141, 1.0);
      case UxColors.dark:
        return const Color.fromARGB(255, 9, 26, 41);
      case UxColors.darkLight:
        return const Color.fromARGB(255, 17, 48, 75);
      case UxColors.darkLightSmooth:
        return const Color.fromARGB(255, 21, 60, 95);
    }
  }
}
