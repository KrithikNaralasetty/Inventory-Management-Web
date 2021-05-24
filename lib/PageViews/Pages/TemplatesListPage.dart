import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/APIs.dart';
import 'package:inventory_management_web/Data/ColorData.dart';
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'dart:convert';

import 'package:inventory_management_web/PageViews/LocatorTool.dart';
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';

class TemplatesListPage extends StatefulWidget {
  _templatesState createState() => _templatesState();
}

// ignore: camel_case_types
class _templatesState extends State<TemplatesListPage> {
  String currentTemplate = "";

  List<Widget> getTemplateList() {
    List<Widget> templateTiles = [];
    var tmplts = data.templates;
    int len = tmplts.length;
    for (var i = 0; i < len; i++) {
      templateTiles.add(
        ListTile(
          leading: Icon(
            Icons.document_scanner,
            color: iconColor,
          ),
          title: Text(tmplts[i].tname),
          onTap: () {
            setState(() {
              if (tmplts[i].template != "null") {
                currentTemplate = tmplts[i].template;
              }
            });
          },
        ),
      );
    }
    return templateTiles;
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              //Title Row
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: iconColor,
                        ),
                        onPressed: () {
                          pageLocator<PageNavigationService>().goBack();
                          pageLocator<PageNavigationService>()
                              .navigateTo(overviewPageRoute);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Center(
                        child: Text(
                          "List of Templates",
                          style: textSt,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //List of Templates
              Expanded(
                flex: 9,
                child: ListView(
                  children: getTemplateList(),
                ),
              )
            ],
          ),
        ),
        //Template OverView
        // Expanded(
        //   child: Placeholder(),
        // )
      ],
    );
  }
}
