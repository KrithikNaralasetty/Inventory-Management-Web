import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  _settingsState createState() => _settingsState();
}

// ignore: camel_case_types
class _settingsState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Text(
        "Settings Page",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
