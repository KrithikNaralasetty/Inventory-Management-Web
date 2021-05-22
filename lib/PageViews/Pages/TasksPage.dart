import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/APIs.dart';
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'dart:convert';

class TasksPage extends StatefulWidget {
  _taskState createState() => _taskState();
}

// ignore: camel_case_types
class _taskState extends State<TasksPage> {
  var tasks = data.records;

  

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: api.getTemplates(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var records = json.decode(snapshot.data.body);
            debugPrint("$records");
            return Container(
              color: Colors.black,
              height: 500,
              width: 500,
            );
          } else {
            return Container(
              color: Colors.transparent,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
