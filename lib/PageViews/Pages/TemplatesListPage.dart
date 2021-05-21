import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/mechs.dart';

class TemplatesListPage extends StatefulWidget {
  _templatesState createState() => _templatesState();
}

// ignore: camel_case_types
class _templatesState extends State<TemplatesListPage> {
  var tasks = services;
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ListTile(
            title: Text(
              "Templates List Page",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.accessibility_new_rounded),
          ),
        ],
      ),
    );
  }
}
