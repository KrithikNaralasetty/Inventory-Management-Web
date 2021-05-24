import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/ColorData.dart';
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

    for (var i = 0; i < tasks.length; i++) {
      var works = tasks[i].status;
      var dates = tasks[i].dos;
      var desc = tasks[i].uid;
      pt.add(Container(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          tileColor: primary,
          leading: Icon(
            Icons.bubble_chart,
            color: iconColor,
          ),
          subtitle: Text(
            dates.toString(),
            style: textSt,
          ),
          title: Text(
            desc.toString(),
            style: textSt,
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
              child: Container(
                color: primary,
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Pending Tasks: $len",
                  style: textSt,
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
          style: textSt,
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
    var srvs = data.records;
    int len = srvs.length;
    for (var i = 0; i < len; i++) {
      srvices.add(
        ListTile(
          title: Text(srvs[i].sno.toString() + " " + srvs[i].wid_s.toString()),
          subtitle: Text(srvs[i].dos.toString()),
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
        title: Text(mcs[i].eqtype.toString()),
        subtitle: Text(mcs[i].sno.toString()),
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
          leading: Icon(
            Icons.person,
            color: iconColor,
          ),
          title: Text(wrkrs[i].wname.toString()),
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
                  color: cd.primary,
                  child: ListView(
                    children: get_equipments(),
                  )),
            ),
            //Recent Machines under Service
            Container(
              child: Card(
                  elevation: 20.0,
                  color: cd.primary,
                  child: ListView(
                    children: get_recent_services(),
                  )),
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
                  )),
            ),
            //List of Workers
            // Container(
            //   child: Card(
            //     elevation: 20.0,
            //     color: cd.primary,
            //     child: FutureBuilder(
            //       future: data.getWorkerData(),
            //       builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
            //       if (snapshot.hasData){
            //         return get_workers_list();
            //       }
            //       else{
            //         return Center(child: CircularProgressIndicator(),);
            //       }
            //     }),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
