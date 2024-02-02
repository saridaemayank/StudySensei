// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:study_sensei/themes/theme_constants.dart';

class ThemeProvider with ChangeNotifier {
ThemeData _themeData = lightmode;

ThemeData get themeData => _themeData;

set themeData(ThemeData themeData) {
  _themeData = themeData;
  notifyListeners();
  }
 void toggleTheme() {
  if (_themeData == lightmode) {
    themeData = darkmode;
  } else {
    themeData = lightmode;
  }
 }
}