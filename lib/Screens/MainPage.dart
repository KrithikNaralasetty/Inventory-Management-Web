import 'package:flutter/material.dart';
import 'dart:ui';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/rendering.dart';
import 'package:inventory_management_web/PageViews/LocatorTool.dart';
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';
import 'package:inventory_management_web/Screens/SearchMenu.dart';

class MainPage extends StatefulWidget {
  final String username;
  MainPage(this.username);
  @override
  _Dashboard createState() => _Dashboard(this.username);
}

class _Dashboard extends State<MainPage> {
  String username;
  double h, w;
  String navigationPath;
  _Dashboard(user) {
    this.username = user;
  }

  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    navigationPath = overviewPageRoute;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 10.0,
          child: ListView(
            children: [
              //Image Icon
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 27, 62),
                ),
                currentAccountPicture: Image.asset("assets/Images/logo_1.jpg"),
                accountName: Text(
                  this.username,
                ),
                accountEmail: TextButton(
                  child: Text(
                    "formfielduser@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    html.window.open("https://www.google.com", "nice");
                  },
                ),
              ),
              //ListTile (OverView)
              new ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Overview"),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    navigationPath = overviewPageRoute;
                  });
                  locator<NavigationService>().goBack();
                  locator<NavigationService>().navigateTo(navigationPath);
                },
              ),
              //ListTile (Machines Page)
              new ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Machines Page"),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    navigationPath = machinePageRoute;
                  });
                  locator<NavigationService>().goBack();
                  locator<NavigationService>().navigateTo(navigationPath);
                },
              ),
              //ListTile (Tasks Overview)
              new ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Tasks"),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    navigationPath = tasksPageRoute;
                  });
                  locator<NavigationService>().goBack();
                  locator<NavigationService>().navigateTo(navigationPath);
                },
              ),
              //ListTile (Create Machine Page)
              new ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Add/Create New Machine"),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    navigationPath = addMachinePageRoute;
                  });
                  locator<NavigationService>().goBack();
                  locator<NavigationService>().navigateTo(navigationPath);
                },
              ),
              //ListTile (Settings)
              new ListTile(
                hoverColor: Color.fromARGB(255, 31, 47, 102),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text("Settings"),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    navigationPath = settingsPageRoute;
                  });
                  locator<NavigationService>().goBack();
                  locator<NavigationService>().navigateTo(navigationPath);
                },
              ),
              // ListTile (LogOut)
              new ListTile(
                title: Text("Logout"),onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        appBar: new AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0.0,
          title: Text(
            "Welcome, " + this.username,
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          
        ),
        body: Column(
          children: [
            Expanded(child: SearchMenu(), flex: 12),
            Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigatorkey,
                  onGenerateRoute: generateRoute,
                  initialRoute: overviewPageRoute,
                ),
                flex: 88),
          ],
        ),
      ),
    );
  }
}
