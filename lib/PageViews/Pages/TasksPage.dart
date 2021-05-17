import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/mechs.dart';

class TasksPage extends StatefulWidget {
  _taskState createState() => _taskState();
}

// ignore: camel_case_types
class _taskState extends State<TasksPage> {
  var tasks = services;
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ListTile(
            title: Text(
              "Tasks Page",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.accessibility_new_rounded),
          ),
          ListTile(
            title: Text(tasks["record"][0]),
            leading: Icon(Icons.accessibility_new_rounded),
          ),
        ],
      ),
    );
  }
}
