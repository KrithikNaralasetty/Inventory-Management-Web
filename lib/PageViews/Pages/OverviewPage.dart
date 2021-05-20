import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/ColorData.dart';
import 'package:inventory_management_web/PageViews/LocatorTool.dart';
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';
import 'package:inventory_management_web/data/ColorData.dart' as cd;
import 'package:inventory_management_web/Data/mechs.dart';
import 'dart:io';
// ignore: unused_import
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:qr_flutter/qr_flutter.dart';


// ignore: must_be_immutable
class Overview extends StatefulWidget {
  Overview({Key key}) : super(key: key);
  var mechs = Mechs;
  _OverviewState createState() => _OverviewState(mechs);
}

class _OverviewState extends State<Overview> {
  var mechs, srvs = services, wrks = workers, adms = admins, tmpts = templates;

  String qrCode = "mech0101qwx";
  double h, w;
  int tasks = services["working"].length;
  List<Widget> pend_tasks = [];

  Color getWorking(bool value) {
    if (value == true) {
      return Colors.green;
    }
    return Colors.red;
  }

  List<Widget> get_pend_tasks(var s) {
    List<Widget> pt = [
      Container(padding: EdgeInsets.all(6.0),child: Center(child: Text("Pending Tasks: $tasks",style: textSt,),),)
    ];
    var works = s["working"];
    var dates = s["dos"];
    var desc = s["record"];
    for (var i = 0; i < tasks; i++) {
      pt.add(Container(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          tileColor: primary,
          leading: Icon(
            Icons.bubble_chart,
            color: iconColor,
          ),
          subtitle: Text(
            dates[i].toString(),
            style: textSt,
          ),
          title: Text(
            desc[i].toString(),
            style: textSt,
          ),
          trailing: Icon(
            Icons.work,
            color: getWorking(works[i]),
          ),
        ),
      ));
    }
    return pt;
  }

  _OverviewState(this.mechs);
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    pend_tasks = get_pend_tasks(srvs);

    return SafeArea(
      child: Center(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: (w) / (h * 2),
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          children: [
            //Total Tasks Left
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: Expanded(
                  child: InkWell(
                    child: ListView(
                            children: pend_tasks,
                          ),
                    onLongPress: () {
                      locator<NavigationService>().goBack();
                      locator<NavigationService>().navigateTo(tasksPageRoute);
                    },
                  ),
                ),
              ),
            ),
            //Types of Equipments
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: Column(
                  children: [
                    Expanded(child: Placeholder(), flex: 2),
                    Expanded(
                      flex: 10,
                      child: ListView(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Recent Machines under Service
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
            //List of Machines
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
            //Templates Lists
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
            //List of QR Codes
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
            //List of Workers
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}