import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/ColorData.dart' as cd;
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'package:inventory_management_web/PageViews/LocatorTool.dart';
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';

class SettingsPage extends StatefulWidget {
  _settingsState createState() => _settingsState();
}

// ignore: camel_case_types
class _settingsState extends State<SettingsPage> {
  String oldPassword, newPassword;
  bool samePassword = false, noChange = false;

  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    pageLocator<PageNavigationService>().goBack();
                    pageLocator<PageNavigationService>()
                        .navigateTo(overviewPageRoute);
                  },
                ),
              ),
              Expanded(
                flex: 8,
                child: Center(
                  child: Text(
                    "Settings: Admin Alpha",
                    style: cd.textSt,
                  ),
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Expanded(
                  child: Container(
                    child: Text("Change Password"),
                    padding: EdgeInsets.all(20.0),
                  ),
                ),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Old password",
                    ),
                    onChanged: (value) {
                      setState(() {
                        this.oldPassword = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter New password",
                    ),
                    onChanged: (value) {
                      setState(() {
                        this.newPassword = value;
                        if (value == this.oldPassword) {
                          this.samePassword = true;
                        } else {
                          this.samePassword = false;
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Re-enter New password",
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value == this.newPassword) {
                          this.noChange = true;
                        } else {
                          this.noChange = false;
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                    child: TextButton(
                  child: Text("Change"),
                  onPressed: () {
                    if (this.noChange && !this.samePassword) {
                      data.admins["uname"][0] = this.newPassword;
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                  "Same as Old Password/ New Passwords don't Match"),
                              content: Text(
                                  "Enter the correct Passwords in each field"),
                              actions: [
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },);
                    }
                  },
                ))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
