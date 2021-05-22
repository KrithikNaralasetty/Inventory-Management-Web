// ignore: unused_import
import 'dart:ui';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/rendering.dart';
// ignore: unused_import
import 'package:inventory_management_web/Screens/LoginPage.dart';
import 'package:inventory_management_web/Screens/MainPage.dart';
import 'Data/TablesData.dart';
import 'PageViews/LocatorTool.dart';

void main() {
  setupPageLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Portal',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Welcome to Form Field'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.title);
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  String _title;
  _MyHomePageState(this._title);

  @override
  Widget build(BuildContext context) {
    return MainPage("Alpha");
  }
}