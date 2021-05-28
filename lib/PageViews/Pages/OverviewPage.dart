import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:inventory_management_web/Data/APIs.dart';
import 'package:inventory_management_web/Data/ColorData.dart';
import 'dart:core';
import 'package:inventory_management_web/PageViews/LocatorTool.dart';
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';
import 'package:inventory_management_web/data/ColorData.dart' as cd;
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'dart:io';
// ignore: unused_import
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class Overview extends StatefulWidget {
  Overview({Key key}) : super(key: key);
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  double h, w;
  int tasks = data.records.length;
  String wname = "";
  // ignore: non_constant_identifier_names

  Color getWorking(bool value) {
    if (value == true) {
      return Colors.green;
    }
    return Colors.red;
  }

  List<Widget> get_pend_tasks() {
    List<Widget> pt = [];
    var tasks = data.records;
    int len = tasks.length;
    Map<String, data.MachineData> uniqueUids = {};
    var uidSet = new Set();
    for (var i in tasks) {
      uidSet.add(i.uid);
    }
    for (var i in data.machines) {
      if (uidSet.contains(i.uid)) {
        uniqueUids[i.uid] = i;
      }
    }

    for (var i = 0; i < tasks.length; i++) {
      var works = tasks[i].status;
      var dates = tasks[i].dos;
      var desc = uniqueUids[tasks[i].uid].eqtype +
          " " +
          uniqueUids[tasks[i].uid].model;
      pt.add(Container(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          leading: Icon(
            Icons.bubble_chart,
            color: iconColor,
          ),
          subtitle: Text(
            dates.toString(),
            style: textStSubtitle,
          ),
          title: Text(
            desc.toString(),
            style: textStTitle,
          ),
          trailing: Icon(
            Icons.work,
            color: getWorking(works),
          ),
        ),
      ));
    }

    List<Widget> pend_task = [
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Pending Tasks: $len",
                  style: textStTitle,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  pageLocator<PageNavigationService>().goBack();
                  pageLocator<PageNavigationService>()
                      .navigateTo(tasksPageRoute);
                },
                icon: Icon(
                  Icons.menu,
                  color: iconColor,
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
          flex: 9,
          child: ListView(
            children: pt,
          ))
    ];

    return pend_task;
  }

  List<Widget> get_equipments() {
    var mcns = data.machines;
    List<Widget> eq = [
      SizedBox(
        height: 20.0,
      ),
      Center(
        child: Text(
          "Equipment Types",
          style: textStTitle,
        ),
      ),
    ];
    List eqs = [];
    for (var i = 0; i < mcns.length; i++) {
      if (eqs.contains(mcns[i].eqtype) == false) {
        eqs.add(mcns[i].eqtype);
      }
    }
    for (var i in eqs) {
      eq.add(Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          tileColor: Colors.transparent,
          leading: Icon(
            Icons.bubble_chart,
            color: iconColor,
          ),
          title: Text(
            i.toString(),
            style: textStTitle,
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
    List<Widget> s = [];
    var srvs = data.records;
    int len = srvs.length;

    Map<String, data.MachineData> uniqueUids = {};
    var uidSet = new Set();
    for (var i in srvs) {
      uidSet.add(i.uid);
    }
    for (var i in data.machines) {
      if (uidSet.contains(i.uid)) {
        uniqueUids[i.uid] = i;
      }
    }
    for (var i = 0; i < len; i++) {
      s.add(
        ListTile(
          title: Text(
            uniqueUids[srvs[i].uid].eqtype +
                " " +
                uniqueUids[srvs[i].uid].model,
            style: textStTitle,
          ),
          subtitle: Text(
            srvs[i].dos.toString(),
            style: textStSubtitle,
          ),
          leading: Icon(
            Icons.arrow_right_alt,
            color: iconColor,
          ),
        ),
      );
    }

    List<Widget> srvices = [
      Expanded(
        child: Row(
          children: [
            Expanded(child: Container()),
            Expanded(
              child: Center(
                  child: Text(
                "Recently Serviced records",
                style: textStTitle,
              )),
              flex: 8,
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      Expanded(
        flex: 9,
        child: ListView(
          children: s,
        ),
      ),
    ];

    return srvices;
  }

  List<Widget> get_machines_list() {
    List<Widget> machns = [
      SizedBox(
        height: 20.0,
      ),
      Row(
        children: [
          Expanded(child: Container()),
          Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Machines List",
                  style: textStTitle,
                ),
              )),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    pageLocator<PageNavigationService>().goBack();
                    pageLocator<PageNavigationService>()
                        .navigateTo(machinePageRoute);
                  },
                  icon: Icon(
                    Icons.menu,
                    color: iconColor,
                  ))),
        ],
      )
    ];
    var mcs = data.machines;
    int len = mcs.length;
    for (var i = 0; i < len; i++) {
      machns.add(ListTile(
        title: Text(
          mcs[i].eqtype.toString(),
          style: textStTitle,
        ),
        subtitle: Text(mcs[i].sno.toString(), style: textStSubtitle),
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
                style: textStTitle,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.menu, color: iconColor),
              onPressed: () {
                pageLocator<PageNavigationService>().goBack();
                pageLocator<PageNavigationService>()
                    .navigateTo(templatesPageRoute);
              },
            ),
          )
        ],
      )
    ];
    var templates = data.templates;
    int len = templates.length;
    for (var i = 0; i < len; i++) {
      templates_list.add(
        ListTile(
          leading: Icon(
            Icons.document_scanner_outlined,
            color: iconColor,
          ),
          title: Text(
            templates[i].tname.toString(),
            style: textStTitle,
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
    var wrkrs = data.workers;
    int len = wrkrs.length;
    for (var i = 0; i < len; i++) {
      worker_list.add(
        ListTile(
          leading: ConstrainedBox(
            child: Image.network(wrkrs[i].wpic,fit: BoxFit.cover),
            constraints: BoxConstraints(
              minWidth: 24,
              minHeight: 24,
              maxWidth: 48,
              maxHeight: 48,
            ),
          ),
          title: Text(
            wrkrs[i].wname.toString(),
            style: textStTitle,
          ),
          subtitle: Text(
            wrkrs[i].wid.toString(),
            style: textStSubtitle,
          ),
          trailing: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Do you want to terminate this worker?",
                          style: textStTitle,
                        ),
                        content: Text(
                          "Once you do this, there is no way to get back the same worker details.\nDo you still want to go ahead?",
                          style: textStSubtitle,
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
            child: Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  "Workers List",
                  style: textStTitle,
                ),
              ),
            ),
            Expanded(
                child: IconButton(
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Add New Worker:",
                        style: textStTitle,
                      ),
                      content: TextField(
                        decoration: InputDecoration(hintText: "Worker Name"),
                        onChanged: (value) {
                          setState(() {
                            this.wname = value;
                          });
                        },
                      ),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              var y = {
                                "wid": data.workers.length + 1,
                                "wpic":
                                    "https://i.ibb.co/GnqT0NV/Whats-App-Image-2021-03-26-at-1-11-23-PM.jpg",
                                "wname": this.wname.toString(),
                              };
                              var x = api.putWorker(json.encode(y));
                              debugPrint(x.toString());
                              Navigator.pop(context);
                            },
                            child: Text("Add")),
                      ],
                    );
                  },
                );
              },
              color: cd.iconColor,
              icon: Icon(Icons.add_circle_outline),
            ))
          ],
        )),
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

  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10.0),
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
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: get_pend_tasks(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Types of Equipments
            Container(
              child: Card(
                  elevation: 20.0,
                  color: Colors.white,
                  child: ListView(
                    children: get_equipments(),
                  )),
            ),
            //Recent Machines under Service
            Container(
              child: Card(
                  elevation: 20.0,
                  color: Colors.white,
                  child: Column(
                    children: get_recent_services(),
                  )),
            ),
            //List of Machines
            Container(
              child: Card(
                elevation: 20.0,
                color: Colors.white,
                child: ListView(
                  children: get_machines_list(),
                ),
              ),
            ),
            //Templates Lists
            Container(
              child: Card(
                  elevation: 20.0,
                  color: Colors.white,
                  child: ListView(
                    children: get_templates_list(),
                  )),
            ),
            //List of Workers
            Container(
              child: Card(
                elevation: 20.0,
                color: Colors.white,
                child: get_workers_list(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
