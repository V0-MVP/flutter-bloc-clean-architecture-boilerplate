import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screens {
  static double heigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double statusbarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isMobile(BuildContext context) {
    if (MediaQuery.of(context).size.width < 728.0) {
      return true;
    } else {
      return false;
    }
  }

  static bool isPortrait(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLandscape(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  static void hideSystemBars() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showSystemBars() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  static double logoSize(BuildContext context) {
    if (Screens.isPortrait(context)) {
      return Screens.heigth(context) * 0.05;
    } else {
      return Screens.width(context) * 0.05;
    }
  }

  static void setPortrait() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }

  static void setLandscape() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
    );
  }

  static void resetOrientation() {
    SystemChrome.setPreferredOrientations([]);
  }
}
