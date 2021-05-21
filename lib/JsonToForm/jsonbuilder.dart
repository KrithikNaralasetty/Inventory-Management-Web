import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:json_to_form/json_to_form.dart';
// ignore: unused_import
import 'models/template.dart';
// ignore: unused_import
import 'package:giffy_dialog/giffy_dialog.dart';

// ignore: must_be_immutable
class JsonBuilder extends StatefulWidget{
  String form;
  String uid;
  bool isResponse ;
  String uname;
  JsonBuilder(this.form,{this.isResponse=false,this.uid=" ",this.uname=" "});


  @override
  JsonBuilderState createState() => new JsonBuilderState();

}

class JsonBuilderState extends State<JsonBuilder>{
  dynamic response;

  Widget giveButton(){
    if(widget.isResponse){
      return  Container(width: MediaQuery.of(context).size.width,
        child: new ElevatedButton(
            child: new Text('Send',style: TextStyle(color: Color.fromARGB(250, 18, 70, 255)),),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.yellow)),
            onPressed: ()async {
              var sendRecord = {
                "dos": "21/10/99",
                "worker": widget.uname,
                "record": this.response,
                "uid":widget.uid
              };
              var respons = await http.post("https://upnr.azurewebsites.net/putrecord",body: json.encode(sendRecord) );
              print(respons.body);
              Navigator.pop(context);
             print(this.response);
//              print(json.encode());
            }),
      );
    }else{
      return  Container(width: MediaQuery.of(context).size.width,
        child: new ElevatedButton(
            child: new Text('go back',style: TextStyle(color: Color.fromARGB(250, 18, 70, 255)),),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.yellow)),
            onPressed: () {
            Navigator.pop(context);
            }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(backgroundColor: Color.fromARGB(250, 18, 70, 255),),
      body: new SingleChildScrollView(
        child: new Container(
          child: new Column(children: <Widget>[
            new CoreForm(
              form: widget.form,
              onChanged: (dynamic response) {
                this.response = response;
              },
            ),
            giveButton()

          ]),
        ),
      ),
    );
  }

}