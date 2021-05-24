import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/APIs.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'dart:convert';

class AddMachinesPage extends StatefulWidget {
  AddMachinesPage({Key key}) : super(key: key);

  _addMachinePageState createState() => _addMachinePageState();
}

// ignore: camel_case_types
class _addMachinePageState extends State<AddMachinesPage> {
  Widget build(BuildContext context) {
    return MachinePage("Form Field Admin", "12345678");
  }
}

// ignore: must_be_immutable
class MachinePage extends StatefulWidget {
  var _username, _password;
  MachinePage(this._username, this._password);
  @override
  State<StatefulWidget> createState() {
    return MachinePageState(_username, _password);
  }
}

class MachinePageState extends State<MachinePage> {
  var _templates = data.templates, _username, _password;
  var day = DateTime.now();
  var time = TimeOfDay.now();
  var timeNow = TimeOfDay.now();
  var dayNow = DateTime.now();
  var responsee;

  bool checkFlag = false;
  String equipmentType, modelNumber, brandName, serialNumber;
  bool equip = false;
  bool model = false;
  bool brand = false;
  bool serial = false;
  String dropDownValue;
  Map<String, String> recordDetails = Map();
  List<DropdownMenuItem> templateDropDownItems = [];
  // ignore: unused_field

  var containerDecor = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    shape: BoxShape.rectangle,
    boxShadow: [
      BoxShadow(offset: Offset(0.0, 0.6), color: Colors.grey, blurRadius: 25.0),
    ],
  );

  void initState() {
    this.templateDropDownItems.add(
          DropdownMenuItem(
            child: Text("Add New Template"),
            value: "Add New Template",
          ),
        );
    super.initState();
  }

  MachinePageState(this._username, this._password);

  void setData() {
    if (this.equip &&
        this.model &&
        this.brand &&
        this.serial &&
        (this.dropDownValue != null)) {
      this.recordDetails["eqtype"] = this.equipmentType;
      this.recordDetails["brand"] = this.brandName;
      this.recordDetails["model"] = this.modelNumber;
      this.recordDetails["serialno"] = this.serialNumber;
      this.recordDetails["doi"] = this.day.toString().substring(0,10);
      this.recordDetails["tname"] = this.dropDownValue;
      this.recordDetails["uid"] = "";
      
    }
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      initialDate: this.day,
      firstDate: DateTime(1960),
      context: context,
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        this.day = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: this.time,
    );

    if (picked != null) {
      setState(() {
        this.time = picked;
      });
    }
  }

  Widget getDropDownList() {
    int i;
    var temps = this._templates;
    if (!this.checkFlag) {
      for (i = 0; i < temps.length; i++) {
        this.templateDropDownItems.add(DropdownMenuItem(
              child: Text(temps[i].tname.toString()),
              value: temps[i].tname,
            ));
      }
      this.checkFlag = true;
    }

    return DropdownButton(
      items: this.templateDropDownItems,
      hint: Text("Select an Option"),
      onChanged: (_value) {
        setState(() {
          this.dropDownValue = _value;
        });
      },
      value: this.dropDownValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _page = Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Machine",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          //Text Field for Equipment Type
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: this.containerDecor,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text("Enter Equipment Type"),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          this.equipmentType = value;
                        } else {
                          this.equipmentType = "default";
                        }
                        this.equip = true;
                      });
                    },
                    decoration: InputDecoration(labelText: "Enter Equipment"),
                  )
                ],
              ),
            ),
          ),
          //Text Field for Model
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: this.containerDecor,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Enter Model",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      this.modelNumber = value;
                      if (value == null)
                        this.model = false;
                      else
                        this.model = true;
                    },
                    decoration: InputDecoration(labelText: "Enter Model Name"),
                  )
                ],
              ),
            ),
          ),
          //Text Field for Brand
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: this.containerDecor,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Enter Brand",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      this.brandName = value;
                      if (value != null)
                        this.brand = true;
                      else
                        this.brand = false;
                    },
                    decoration: InputDecoration(labelText: "Enter Brand"),
                  )
                ],
              ),
            ),
          ),
          //Text Field for Serial number
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: this.containerDecor,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Enter Serial Number",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      this.serialNumber = value;
                      if (value != null)
                        this.serial = true;
                      else
                        this.serial = false;
                    },
                    decoration:
                        InputDecoration(labelText: "Enter Serial Number"),
                  )
                ],
              ),
            ),
          ),
          //Date Pickers Row
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: this.containerDecor,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Enter Date on installation\n(Default Date and time is now)",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF00003f))),
                            child: Text(
                              "Select Day",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              this._selectDate(context);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF00003f))),
                            child: Text(
                              "Select time",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              this._selectTime(context);
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          //Selecting template from a Drop Down List of template
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 100.0,
              decoration: this.containerDecor,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Select a template",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: this.getDropDownList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        backgroundColor: Color(0xFF00003f),
        onPressed: () async {
          setState(() {
            setData();
          });
          var record = json.encode(recordDetails);
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("QR Code"),
                  content: FutureBuilder(
                    future: api.putMachine(record),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        var h = MediaQuery.of(context).size.height *0.3;
                        var w = MediaQuery.of(context).size.height *0.4;
                        var qrData = snapshot.data.body;
                        var qrCode = json.decode(qrData)["uid"]; 
                        return Container(
                          height: h,
                          width:w,
                          child: QrImage(data: qrCode),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  actions: [
                    TextButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
      ),
    );

    return _page;
  }
}
