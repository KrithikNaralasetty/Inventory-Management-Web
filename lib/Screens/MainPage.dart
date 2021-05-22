import 'package:flutter/material.dart';
import 'dart:ui';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/rendering.dart';
import 'package:inventory_management_web/Data/ColorData.dart';
import 'package:inventory_management_web/Data/TablesData.dart';
import 'package:inventory_management_web/PageViews/LocatorTool.dart';
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';
// ignore: unused_import
import 'package:inventory_management_web/data/ColorData.dart' as cd;
// ignore: unused_import
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

    // ignore: non_constant_identifier_names
    Widget DrawerBar = Drawer(
      elevation: 10.0,
      child: ListView(
        children: [
          //User Account Details
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 31, 27, 62),
            ),
            currentAccountPicture: Image.asset("assets/Images/logo_1.jpg"),
            accountName: Text(
              "Admin: $username",
            ),
            accountEmail: TextButton(
              child: Text(
                "admin$username@formfield.com",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                html.window.open("https://www.google.com", "Email");
              },
            ),
          ),
          //ListTile (OverView)
          new ListTile(
            leading: Icon(Icons.arrow_right_rounded),
            title: Text("Overview"),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                navigationPath = overviewPageRoute;
              });
              pageLocator<PageNavigationService>().goBack();
              pageLocator<PageNavigationService>().navigateTo(navigationPath);
            },
          ),
          //ListTile (Machines Page)
          new ListTile(
            leading: Icon(Icons.arrow_right_rounded),
            title: Text("Machines Page"),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                navigationPath = machinePageRoute;
              });
              pageLocator<PageNavigationService>().goBack();
              pageLocator<PageNavigationService>().navigateTo(navigationPath);
            },
          ),
          //ListTile (Tasks Overview)
          new ListTile(
            leading: Icon(Icons.arrow_right_rounded),
            title: Text("Tasks"),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                navigationPath = tasksPageRoute;
              });
              pageLocator<PageNavigationService>().goBack();
              pageLocator<PageNavigationService>().navigateTo(navigationPath);
            },
          ),
          //ListTile (Create Machine Page)
          new ListTile(
            leading: Icon(Icons.arrow_right_rounded),
            title: Text("Add/Create New Machine"),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                navigationPath = addMachinePageRoute;
              });
              pageLocator<PageNavigationService>().goBack();
              pageLocator<PageNavigationService>().navigateTo(navigationPath);
            },
          ),
          //ListTile (Settings)
          new ListTile(
            leading: Icon(Icons.arrow_right_rounded),
            title: Text("Settings"),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                navigationPath = settingsPageRoute;
              });
              pageLocator<PageNavigationService>().goBack();
              pageLocator<PageNavigationService>().navigateTo(navigationPath);
            },
          ),
          // ListTile (LogOut)
          new ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerBar,
        // Appbar (Welcome admin, Icon(about the application), Image(profile picture))
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            "Welcome, $username",
            style: TextStyle(color: primary),
          ),
          iconTheme: IconThemeData(color: iconColor),
          centerTitle: true,
        ),
        //Body (Column of Screens)
        body: Container(
          padding: EdgeInsets.only(left: w * 0.04, top: h * 0.03),
          child: Column(
            children: [
              // Expanded(child: SearchMenu(), flex: 12),
              Expanded(
                  child: Navigator(
                    key: pageLocator<PageNavigationService>().navigatorkey,
                    onGenerateRoute: generatePageRoute,
                    initialRoute: overviewPageRoute,
                  ),
                  flex: 88),
            ],
          ),
        ),
      ),
    );
  }
}
