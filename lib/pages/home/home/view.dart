/*
 * @Author: 郝怿
 * @Date: 2022-02-23 23:10:38
 * @LastEditTime: 2022-03-09 23:59:36
 * @LastEditors: 郝怿
 * @Description: 首页
 * @FilePath: /yuedu2/lib/pages/home/home/view.dart
 */

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuedu2/provider/mainProvider.dart';

import 'provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final p = context.read<HomeProvider>();
    final pp = Provider.of<HomeProvider>(context, listen: true);
    final mp = Provider.of<MainProvider>(context, listen: false);
    p.init();
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Column(
        children: [
          CupertinoSegmentedControl(
            //子标签
            children: const <int, Widget>{
              0: Icon(Icons.light_mode),
              1: Icon(Icons.dark_mode),
              2: Icon(Icons.phone_android),
            },
            //当前选中的索引
            groupValue: pp.modeIndex,
            //点击回调
            onValueChanged: (int index) {
              p.updateModeIndex(index);
            },
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  p.schemeList[index].name,
                  style: TextStyle(
                      color: FlexThemeData.light(scheme: p.schemeList[index])
                          .primaryColor),
                ),
                onTap: () {
                  mp.updateFlexScheme(p.schemeList[index]);
                },
              );
            },
            itemCount: p.schemeList.length,
          ))
        ],
      ),
    );
  }
}
