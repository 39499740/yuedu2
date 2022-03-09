/*
 * @Author: 郝怿
 * @Date: 2022-02-23 23:10:38
 * @LastEditTime: 2022-03-10 00:00:53
 * @LastEditors: 郝怿
 * @Description:  
 * @FilePath: /yuedu2/lib/pages/home/home/provider.dart
 */

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuedu2/provider/mainProvider.dart';

class HomeProvider extends ChangeNotifier {
  BuildContext context;
  HomeProvider(this.context);

  List<FlexScheme> _schemeList = [];
  List<FlexScheme> get schemeList => _schemeList;

  int _modeIndex = 0;
  int get modeIndex => _modeIndex;

  bool _initialized = false;

  void init() {
    if (!_initialized) {
      _initialized = true;
      Future.delayed(const Duration(milliseconds: 100), () {
        _schemeList = FlexScheme.values;
        notifyListeners();
      });
    }
  }

  void updateModeIndex(int i) {
    MainProvider mp = Provider.of<MainProvider>(context, listen: false);
    _modeIndex = i;
    switch (i) {
      case 0:
        mp.updateThemeMode(ThemeMode.light);
        break;
      case 1:
        mp.updateThemeMode(ThemeMode.dark);
        break;
      default:
        mp.updateThemeMode(ThemeMode.system);
    }
    notifyListeners();
  }
}
