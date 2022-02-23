/*
 * @Author: 郝怿
 * @Date: 2022-01-10 23:15:30
 * @LastEditTime: 2022-02-24 00:20:48
 * @LastEditors: 郝怿
 * @Description: 
 * @FilePath: /yuedu2/lib/main.dart
 */
import 'package:flutter/material.dart';
import 'package:yuedu2/router/delegate.dart';
import 'package:yuedu2/router/parser.dart';

void main() {
  runApp(MyApp());
}

MyRouterDelegate delegate = MyRouterDelegate();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    delegate.push(name: "/home");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigator 2.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: delegate,
      routeInformationParser: const MyRouteInformationParser(),
    );
  }
}
