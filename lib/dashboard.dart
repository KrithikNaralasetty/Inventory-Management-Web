import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:inventory_management_web/itemspage.dart';

class Dashboard extends StatefulWidget {
  final String username;
  Dashboard(this.username);
  @override
  _Dashboard createState() => _Dashboard(this.username);
}

class _Dashboard extends State<Dashboard> {
  String username;
  double h, w;
  Widget currScrn;
  _Dashboard(user) {
    this.username = user;
  }
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    currScrn = Container(height: 160,width: 90,color: Colors.black,);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 10.0,
          child: ListView(
            children: [
              //ListTile (OverView)
              ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Overview"),
                onTap: () {
                  setState(() {
                    currScrn = ItemsPage();
                  });
                },
              ),
              //ListTile (Machines Page)
              ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Machines Page"),
                onTap: () {
                  setState(() {
                    currScrn = ItemsPage();
                  });
                },
              ),
              //ListTile (Tasks Overview)
              ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Machines Page"),
                onTap: () {
                  setState(() {
                    currScrn = ItemsPage();
                  });
                },
              ),
              //ListTile (Create Machine Page)
              ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Create Machine Page"),
                onTap: () {
                  setState(() {
                    currScrn = ItemsPage();
                  });
                },
              ),
              //ListTile (Settings)
              ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Machines Page"),
                onTap: () {
                  setState(() {
                    currScrn = ItemsPage();
                  });
                },
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
        body: currScrn,
      ),
    );
  }
}