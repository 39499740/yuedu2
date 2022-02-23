/*
 * @Author: 郝怿
 * @Date: 2022-02-23 23:10:38
 * @LastEditTime: 2022-02-23 23:12:24
 * @LastEditors: 郝怿
 * @Description: 首页
 * @FilePath: /yuedu2/lib/pages/home/home/view.dart
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    p.init();
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
    );
  }
}
