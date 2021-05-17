import 'package:flutter/material.dart';

class AddMachinesPage extends StatefulWidget{
  AddMachinesPage({Key key}) : super(key: key);
  
  _addMachinePageState createState() => _addMachinePageState();
}

// ignore: camel_case_types
class _addMachinePageState extends State<AddMachinesPage>{
  Widget build(BuildContext context){
    return Container(color: Colors.yellow,child: Text(
        "Add Machine Page",
        style: TextStyle(color: Colors.white),
      ));
  }
}