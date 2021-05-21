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
  // ignore: non_constant_identifier_names

  Color getWorking(bool value) {
    if (value == true) {
      return Colors.green;
    }
    return Colors.red;
  }

  List<Widget> get_pend_tasks(var s) {
    List<Widget> pt = [
      SizedBox(
        height: 20.0,
      ),
      Center(
        child: Text(
          "Pending Tasks: $tasks",
          style: textSt,
        ),
      ),
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

  List<Widget> get_equipments() {
    List<Widget> eq = [
      SizedBox(
        height: 20.0,
      ),
      Center(
        child: Text(
          "Equipment Types",
          style: textSt,
        ),
      ),
    ];
    var eqs = equipments;
    for (var i in eqs.keys) {
      eq.add(Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          tileColor: Colors.transparent,
          leading: Icon(
            Icons.bubble_chart,
            color: iconColor,
          ),
          title: Text(
            eqs[i],
            style: textSt,
          ),
          trailing: Icon(
            Icons.check_box_outline_blank,
            color: iconColor,
          ),
        ),
      ));
    }
    return eq;
  }

  List<Widget> get_recent_services() {
    List<Widget> srvices = [
      SizedBox(
        height: 20.0,
      ),
      Center(
        child: Text(
          "Recently Serviced Machines",
          style: textSt,
        ),
      ),
    ];
    var temp = this.srvs;
    var srvs = this.srvs;
    int len = srvs["dos"].length;
    for (var i = len - 1; i >= 0; i--) {
      srvices.add(
        ListTile(
          title: Text(srvs["sno"][i].toString() +
              " " +
              srvs["worker_id"][i].toString()),
          subtitle: Text(srvs["dos"][i].toString()),
          leading: Icon(
            Icons.arrow_right_alt,
            color: iconColor,
          ),
        ),
      );
    }
    return srvices;
  }

  List<Widget> get_machines_list() {
    List<Widget> machns = [
      SizedBox(
        height: 20.0,
      ),
      Row(
        children: [
          Expanded(child: Container(color: primary)),
          Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Machines List",
                  style: textSt,
                ),
              )),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    locator<NavigationService>().goBack();
                    locator<NavigationService>().navigateTo(machinePageRoute);
                  },
                  icon: Icon(
                    Icons.menu,
                    color: iconColor,
                  ))),
        ],
      )
    ];
    var mcs = this.mechs;
    var eqs = equipments;
    int len = mcs["uid"].length;
    for (var i = 0; i < len; i++) {
      machns.add(ListTile(
        title: Text(eqs[mcs["eqtype"][i]].toString()),
        subtitle: Text(mcs["sno"][i].toString()),
        leading: Icon(
          Icons.reviews_rounded,
          color: iconColor,
        ),
      ));
    }
    return machns;
  }

  List<Widget> get_templates_list() {
    List<Widget> templates_list = [
      SizedBox(
        height: 20.0,
      ),
      Row(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                "List of Available Templates",
                style: textSt,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.menu, color: iconColor),
              onPressed: () {
                locator<NavigationService>().goBack();
                locator<NavigationService>().navigateTo(templatesPageRoute);
              },
            ),
          )
        ],
      )
    ];
    var templates = this.tmpts;
    int len = templates["tname"].length;
    for (var i = 0; i < len; i++) {
      templates_list.add(
        ListTile(
          leading: Icon(
            Icons.document_scanner_outlined,
            color: iconColor,
          ),
          title: Text(
            templates["tname"][i].toString(),
          ),
          trailing: Icon(
            Icons.check_box_outline_blank,
            color: iconColor,
          ),
        ),
      );
    }
    return templates_list;
  }

  Widget get_workers_list() {
    List<Widget> worker_list = [];
    var wrks = this.wrks;
    int len = this.wrks["uname"].length;
    for (var i = 0; i < len; i++) {
      worker_list.add(
        ListTile(
          leading: Icon(
            Icons.person,
            color: iconColor,
          ),
          title: Text(wrks["uname"][i].toString()),
          trailing: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Do you want to terminate this worker?",
                          style: textSt,
                        ),
                        content: Text(
                          "Once you do this, there is no way to get back the same worker details.\nDo you still want to go ahead?",
                          style: textSt,
                        ),
                        backgroundColor: Colors.black,
                        actions: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "No",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      );
                    });
              },
              child: Text("Delete")),
        ),
      );
    }

    Widget worker_card = Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Workers List",
              style: textSt,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: worker_list,
          ),
          flex: 10,
        )
      ],
    );
    return worker_card;
  }

  _OverviewState(this.mechs);
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

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
                      children: get_pend_tasks(srvs),
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
                child: ListView(
                  children: get_equipments(),
                ),
              ),
            ),
            //Recent Machines under Service
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: ListView(
                  children: get_recent_services(),
                ),
              ),
            ),
            //List of Machines
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: ListView(
                  children: get_machines_list(),
                ),
              ),
            ),
            //Templates Lists
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: ListView(
                  children: get_templates_list(),
                ),
              ),
            ),
            //List of Workers
            Container(
              child: Card(
                elevation: 20.0,
                color: cd.primary,
                child: get_workers_list(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
