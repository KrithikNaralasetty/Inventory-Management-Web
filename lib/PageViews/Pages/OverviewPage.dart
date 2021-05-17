import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/mechs.dart';

// ignore: must_be_immutable
class Overview extends StatefulWidget{
  Overview({Key key}) : super(key: key);
  var mechs = Mechs;
  _OverviewState createState() => _OverviewState(mechs);
}

class _OverviewState extends State<Overview>{
  var mechs;
  _OverviewState(this.mechs);
  Widget build(BuildContext context){

    return Container(
      height: 400,
      width: 600,
      color: Colors.amber,
    );
  }
}