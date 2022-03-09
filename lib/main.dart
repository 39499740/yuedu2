/*
 * @Author: 郝怿
 * @Date: 2022-01-10 23:15:30
 * @LastEditTime: 2022-03-09 23:44:00
 * @LastEditors: 郝怿
 * @Description: 
 * @FilePath: /yuedu2/lib/main.dart
 */
import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yuedu2/provider/mainProvider.dart';
import 'package:yuedu2/router/delegate.dart';
import 'package:yuedu2/router/parser.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MainProvider())],
    child: MyApp(),
  ));
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

MyRouterDelegate delegate = MyRouterDelegate();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    delegate.push(name: "/home");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainProvider mpp = Provider.of<MainProvider>(context, listen: true);
    return MaterialApp.router(
      title: 'Navigator 2.0',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: mpp.flexScheme),
      darkTheme: FlexThemeData.dark(scheme: mpp.flexScheme),
      themeMode: mpp.themeMode,
      routerDelegate: delegate,
      routeInformationParser: const MyRouteInformationParser(),
    );
  }
}
