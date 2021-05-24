import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/ColorData.dart';
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';
import 'package:inventory_management_web/PageViews/TaskPieChart.dart';

import '../LocatorTool.dart';

class TasksPage extends StatefulWidget {
  _taskState createState() => _taskState();
}

// ignore: camel_case_types
class _taskState extends State<TasksPage> {
  var tasks = data.records;

  Widget getStatusIcon(bool flag) {
    if (flag == true) {
      return Icon(
        Icons.check_box_outlined,
        color: Colors.green,
      );
    }
    return Icon(Icons.dangerous, color: Colors.red);
  }

  List<Widget> getTasksList() {
    List<Widget> taskTiles = [];
    for (var i in tasks) {
      taskTiles.add(ListTile(
        leading: Icon(Icons.document_scanner_outlined, color: iconColor),
        title: Text(i.dos.toString()),
        subtitle: Text(i.sno.toString()),
        trailing: getStatusIcon(i.status),
      ));
    }
    return taskTiles;
  }

  Widget getCharts() {
    return Column(
      children: [
        //Bar Graph of Worker Works
        Expanded(
            child: Row(
          children: [
            Expanded(
              child:
                  Container(padding: EdgeInsets.all(5.0), child: Placeholder()),
            ),
          ],
        )),
        //Pie Chart of Pending Tasks Painter
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: TaskPieChartWidget(),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          pageLocator<PageNavigationService>().goBack();
                          pageLocator<PageNavigationService>()
                              .navigateTo(overviewPageRoute);
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: iconColor,
                        )),
                  ),
                  Expanded(
                    flex: 8,
                    child: Center(
                        child: Text(
                      "List of Pending Tasks",
                      style: textSt,
                    )),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.replay_outlined,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 10,
                child: ListView(
                  children: getTasksList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: getCharts(),
        ),
      ],
    );
  }
}
