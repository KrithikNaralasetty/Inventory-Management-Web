// ignore: non_constant_identifier_names
// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventory_management_web/Data/APIs.dart';

List<dynamic> machines = [];
List<dynamic> templates = [];
List<dynamic> records = [];
List<dynamic> workers = [];

Future<dynamic> getMachineData() async {
  //Adding List of MachineData Objects
  var x = await api.getMachines();
  var y = json.decode(x.body);
  int len = y.length;
  for (var i = 0; i < len; i++) {
    var mcn = y[i];
    machines.add(new MachineData(mcn));
  }
  return x;
}

Future<dynamic> getTemplateData() async{
  //Adding List of TemplateData Objects
  var x = await api.getTemplates();
  var y = json.decode(x.body);
  int len = y.length;
  for (var i = 0; i < len; i++) {
    var tps = y[i];
    templates.add(
      new TemplateData(tps),
    );
  }
  return x;
}

Future<dynamic> getRecordData() async{
  //Adding List of RecordData Objects
  var x = await api.getRecords();
  var y = json.decode(x.body);
  int len = y.length;
  for (var i = 0; i < len; i++) {
    var rcds = y[i];
    records.add(
      new RecordData(rcds),
    );
  }
  return x;
}

Future<dynamic> getWorkerData() async {
  //Adding List of WorkerData Objects
  var x = await api.getWorkers();
  var y = json.decode(x.body);
  int len = y.length;
  for (var i=0;i<len;i++){
    var wrks = y[i];
    workers.add(
      new WorkerData(wrks),
    );
  }
  return x;
}

class MachineData {
  String eqtype, brand, model, sno, uid, tname;
  String doi;
  MachineData(var mechs) {
    this.eqtype = mechs["eqtype"];
    this.brand = mechs["brand"];
    this.model = mechs["model"];
    this.sno = mechs["serialno"];
    this.uid = mechs["uid"];
    this.tname = mechs["tname"];
    this.doi = mechs["doi"];
  }
}

class TemplateData {
  String tname;
  String template;
  TemplateData(var tps) {
    this.tname = tps["tname"];
    this.template = tps["templates"];
  }
}

class WorkerData {
  int wid;
  String wname, wpic;
  WorkerData(var worker) {
    this.wid = worker["wid"];
    this.wname = worker["wname"];
    this.wpic = worker["wpic"];
  }
}

class RecordData {
  String uid;
  bool status;
  // ignore: non_constant_identifier_names
  int sno, wid_s, wid_c;
  String dos, doc;
  String template;
  RecordData(var records) {
    this.uid = records["uid"];
    if (records["status"] == "True"){
      this.status = true;
    }
    else{
      this.status = false;
    }
    this.sno = records["sno"];
    this.wid_s = records["wid_s"];
    this.wid_c = records["wid_c"];
    this.dos = records["dos"];
    this.doc = records["doc"];
    this.template = records["record"];
  }
}

Map<String, List<String>> admins = {
  "uname": ["Alpha","Beta","Gamma","Delta"],
  "psswd": ["12345678","11223344","12341234","56785678"],
};