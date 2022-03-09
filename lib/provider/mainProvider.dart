/*
 * @Author: 郝怿
 * @Date: 2022-03-09 23:39:33
 * @LastEditTime: 2022-03-09 23:42:59
 * @LastEditors: 郝怿
 * @Description: 
 * @FilePath: /yuedu2/lib/provider/mainProvider.dart
 */

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  FlexScheme _flexScheme = FlexScheme.blue;
  FlexScheme get flexScheme => _flexScheme;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void updateFlexScheme(FlexScheme fs) {
    _flexScheme = fs;
    notifyListeners();
  }

  void updateThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
