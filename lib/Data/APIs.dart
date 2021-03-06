import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'package:flutter/material.dart';

final DataApi api = DataApi();

class DataApi {
  final String mainURL = "https://formfield.azurewebsites.net/";
  Map<String, String> functions = {};
  DataApi(){
    this.functions["getTemplate"] = mainURL+"gettemplates";
    this.functions["putTemplate"] = mainURL+"puttemplate";
    this.functions["getMachine"] = mainURL+"getmachines";
    this.functions["getMachineUid"] = mainURL+"getmachine?uid=";
    this.functions["putMachine"] = mainURL+"putmachine";
    this.functions["getWorkers"] = mainURL+"/getworkers";
    this.functions["putWorker"] = mainURL+"putworker";
    this.functions["putRecord"] = mainURL+"putrecord";
    this.functions["getRecord"] = mainURL+"getrecords";
    
  }
  String getApi(String function){
    return this.functions[function];
  }

  Future<dynamic> getData() async{
  var x;
  bool flag = true;
  x = await data.getMachineData();
  x = await data.getRecordData();
  x = await data.getTemplateData();
  x = await data.getWorkerData();
  return flag;
  }

  Future<dynamic> getTemplates() async {
    String url = this.getApi("getTemplate");
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    return response;
  }

  Future<dynamic> putTemplate(var data) async {
    String url = this.getApi("putTemplate");
    Uri uri = Uri.parse(url);
    var response = await http.post(uri, body: data.toString(),headers: {"Content-Type": "application/json"});
    return response;
  }

  Future<dynamic> getMachines() async {
    String url = this.getApi("getMachine");
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    return response;
  }

  Future<dynamic> getMachine(String uid) async {
    String url = this.getApi("getMachineUid");
    Uri uri = Uri.parse(url + uid);
    var response = await http.get(uri);
    return response;
  }

  Future<dynamic> putMachine(var data) async {
    String url = this.getApi("putMachine");
    Uri uri = Uri.parse(url);
    var response = await http.post(uri, body: data.toString(),headers: {"Content-Type": "application/json"});
    return response;
  }

  Future<dynamic> putRecord(var data) async {
    String url = this.getApi("putRecord");
    Uri uri = Uri.parse(url);
    var response = await http.post(uri, body: data.toString(),headers: {"Content-Type": "application/json"});
    return response;
  }

  Future<dynamic> getRecords() async {
    String url = this.getApi("getRecord");
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    return response;
  }

  Future<dynamic> getWorkers() async {
    String url = this.getApi("getWorkers");
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    return response;
  }

  Future<dynamic> putWorker(var data) async {
    String url = this.getApi("putWorker");
    Uri uri = Uri.parse(url);
    var response = await http.post(uri, body: data.toString(), headers: {"Content-Type": "application/json"});
    return response;
  }
}