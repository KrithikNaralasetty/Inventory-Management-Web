import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:json_to_form/json_to_form.dart';
// ignore: unused_import
import 'models/template.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
// ignore: unused_import
import 'jsonbuilder.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.tname}) : super(key: key);

  final String title;
  String tname;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myHomePageState = GlobalKey<_MyHomePageState>();
  List template = [];
  List display = [];
  String descc =
      """ used when there are lists of options and the user may select any number of choices, including zero, one, or several. In other words, each checkbox is independent of all other checkboxes in the list, so checking one box doesn't uncheck the others.""";
  ElevatedButton bottom;

  @override
  // ignore: must_call_super
  void initState() {
    bottom = ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.yellow)),
      child: Text(
        "Put Template",
        style: TextStyle(color: Color.fromARGB(250, 18, 70, 255)),
      ),
      onPressed: () async {
        var formm = jsonEncode({
          "tname": widget.tname,
          "template": jsonEncode(template),
        });
        Uri url = Uri.parse("https://formfield.azurewebsites.net/puttemplate");
        var response = await http.post(url,
            body: formm,
            headers: {"Content-Type": "application/json"});
        print(response.body);
        print(formm);

//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => JsonBuilder(formm)));
        Navigator.pop(context);
        print(formm);
      },
    );
    display.add(bottom);
  }

  refresh() {
    setState(() {});
  }

  _addTextDialog(BuildContext context) async {
    TextEditingController temp = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return NetworkGiffyDialog(
            title: Text('use to add textual info, numeric values',
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400)),
            image: Column(
              children: <Widget>[
                Image.network(
                  "https://miro.medium.com/max/3675/1*PrOpoN6DYcyTZ6uYIQGoLg.gif",
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Add Title For Text Field",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: temp,
                  decoration:
                      InputDecoration(hintText: "how many litres petrol?"),
                )
              ],
            ),
            onOkButtonPressed: () {
              template.add({
                'type': 'Input',
                'title': temp.text,
                'placeholder': "how many litres petrol?"
              });
              setState(() {
                display.removeLast();
                display.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          labelText: temp.text,
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                ));
                display.add(bottom);
              });

              Navigator.of(context).pop();
            },
          );
        });
  }

  _addSwitchDialog(BuildContext context) async {
    bool value = false;
    TextEditingController temp = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return NetworkGiffyDialog(
            title: Text(' use as a single option where you can turn on or off.',
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400)),
            image: Column(
              children: <Widget>[
                Image.network(
                  "https://i1.wp.com/codemyui.com/wp-content/uploads/2016/04/rounded-toggle-switch.gif?fit=880%2C440&ssl=1",
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Text(
                    "Add Title For Switch",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: TextField(
                    controller: temp,
                    decoration: InputDecoration(hintText: "Is Car Working"),
                  ),
                )
              ],
            ),
            onOkButtonPressed: () {
              template.add({
                'type': 'Switch',
                'title': temp.text,
                'switchValue': false,
              });
              setState(() {
                display.removeLast();
                display.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      elevation: 8.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(temp.text + " : "),
                          Switch(
                            value: value,
                            onChanged: (toggle) {
                              setState(() {
                                value = toggle;
                              });
                            },
                          )
                        ],
                      )),
                ));
                display.add(bottom);
              });
              Navigator.of(context).pop();
            },
          );
        });
  }

  _addCheckDialog(BuildContext context, Function something) async {
    TextEditingController temp = new TextEditingController();
    TextEditingController field = new TextEditingController();
    List items = [];
    List mappeditems = [];
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text('CheckBoxes'),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(descc,
                        style: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.w400)),
                    Image.network(
                      "https://cdn.dribbble.com/users/108183/screenshots/2398414/checkboxes.gif",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 200.0,
                      child: TextField(
                        controller: temp,
                        decoration: InputDecoration(
                            hintText: "Title of CheckButton List"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          child: TextField(
                            controller: field,
                            decoration: InputDecoration(hintText: "Item name"),
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(250, 18, 70, 255))),
                            child: Text(
                              "Add item",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              mappeditems.add({
                                'title': field.text,
                                'value': false,
                              });

                              setState(() {
                                items.add(Row(children: <Widget>[
                                  Container(
                                    width: 200.0,
                                    child: CheckboxListTile(
                                      onChanged: (check) {},
                                      title: new Text(field.text),
                                      value: false,
                                    ),
                                  )
                                ]));
                                field.clear();
                              });
                            })
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return items[index];
                        },
                        itemCount: items.length,
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                new TextButton(
                  child: new Text('Add Field'),
                  onPressed: () {
                    template.add({
                      'type': 'Checkbox',
                      'title': temp.text,
                      'list': mappeditems,
                    });
                    int val = template.length - 1;
                    display.removeLast();
                    display.add(Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 8.0,
                        child: Column(
                          children: <Widget>[
                            Text(
                              template[val]['title'],
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: 200.0,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, int index) {
                                  return CheckboxListTile(
                                    onChanged: (check2) {},
                                    title: new Text(
                                        template[val]['list'][index]['title']),
                                    value: false,
                                  );
                                },
                                itemCount: template[val]['list'].length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                    display.add(bottom);
                    something();
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
        });
  }

  dynamic response;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: new AppBar(
        backgroundColor: Color(0xFF00003f),
        title: new Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return display[index];
        },
        itemCount: display.length,
      ),
      floatingActionButton: new Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(250, 18, 70, 255),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(250, 18, 70, 255),
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 2.0, // has the effect of extending the shadow
                offset: Offset(
                  2.0, // horizontal, move right 10
                  2.0, // vertical, move down 10
                ),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        height: 40.0,
        width: 150.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.text_fields,
                    color: Colors.yellowAccent,
                  ),
                  onPressed: () {
                    _addTextDialog(context);
                    setState(() {});
                  }),
              IconButton(
                  icon: Icon(Icons.check_box, color: Colors.yellow),
                  onPressed: () {
                    _addCheckDialog(context, refresh);
                    setState(() {});
                  }),
              IconButton(
                  icon: Icon(Icons.adjust, color: Colors.yellow),
                  onPressed: () {
                    _addSwitchDialog(context);
                    setState(() {});
                  })
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
