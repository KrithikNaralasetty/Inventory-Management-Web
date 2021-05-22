// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveValue(String file, String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(file, data);
}

getValue(String file) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringval = prefs.getString(file);
  return stringval;
}