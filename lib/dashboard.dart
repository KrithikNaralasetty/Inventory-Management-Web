import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class Dashboard extends StatefulWidget {
  final String username;
  Dashboard(this.username);
  @override
  _Dashboard createState() => _Dashboard(this.username);
}

class _Dashboard extends State<Dashboard> {
  String username;
  double h, w;
  _Dashboard(user) {
    this.username = user;
  }
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: [
            ListTile(
              hoverColor: Color.fromARGB(255, 31, 47, 102),
              leading: Container(
                height: h * 0.016,
                width: h * 0.016,
                child: Icon(Icons.arrow_right_rounded),
              ),
            ),
            ListTile(
              hoverColor: Color.fromARGB(255, 31, 47, 102),
              leading: Container(
                height: h * 0.016,
                width: h * 0.016,
                child: Icon(Icons.arrow_right_rounded),
              ),
            ),
            ListTile(
              hoverColor: Color.fromARGB(255, 31, 47, 102),
              leading: Container(
                height: h * 0.016,
                width: h * 0.016,
                child: Icon(Icons.arrow_right_rounded),
              ),
            ),
            ListTile(
              hoverColor: Color.fromARGB(255, 31, 47, 102),
              leading: Container(
                height: h * 0.016,
                width: h * 0.016,
                child: Icon(Icons.arrow_right_rounded),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0.0,
        title: Text(
          "Welcome, " + this.username,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Placeholder(),
          ),
          Expanded(
            flex: 1,
            child: Placeholder(),
          ),
          Expanded(
            flex: 10,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
