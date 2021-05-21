library json_to_form;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CoreForm extends StatefulWidget {
  const CoreForm({
    @required this.form,
    @required this.onChanged,
    this.padding,
    // ignore: non_constant_identifier_names
    this.form_map,
  });

  final String form;
  // ignore: non_constant_identifier_names
  final dynamic form_map;
  final double padding;
  final ValueChanged<dynamic> onChanged;

  @override
  _CoreFormState createState() =>
      new _CoreFormState(form_map ?? json.decode(form));
}

class _CoreFormState extends State<CoreForm> {
  // ignore: non_constant_identifier_names
  final dynamic form_items;
  List<TextEditingController> tec = [];

  int radioValue;

  // ignore: non_constant_identifier_names
  List<Widget> JsonToForm() {
    List<Widget> listWidget = [];

    for (var count = 0; count < form_items.length; count++) {
      Map item = form_items[count];
      tec.add(TextEditingController(text: " "));
      if (item.containsKey('response')) {
        tec[tec.length - 1].text = item['response'];
      }

      if (item['type'] == "Input" ||
          item['type'] == "Password" ||
          item['type'] == "Email" ||
          item['type'] == "TareaText") {
        Column addit = new Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: new Text(
                  item['title'],
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                )),
            TextField(
              controller: tec[tec.length - 1],
              decoration: new InputDecoration(
                hintText: item['placeholder'] ?? "",
              ),
              maxLines: item['type'] == "TareaText" ? 10 : 1,
              onChanged: (String value) {
                form_items[count]['response'] = value;
                _handleChanged();
              },
              obscureText: item['type'] == "Password" ? true : false,
            )
          ],
        );

        listWidget.add(Card(
          elevation: 8.0,
          child: addit,
        ));
      }

      if (item['type'] == "RadioButton") {
        listWidget.add(new Container(
            margin: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Text(item['title'],
                style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0))));
        radioValue = item['value'];
        for (var i = 0; i < item['list'].length; i++) {
          listWidget.add(new Row(children: <Widget>[
            new Expanded(
                child: new Text(form_items[count]['list'][i]['title'])),
            new Radio<int>(
                value: form_items[count]['list'][i]['value'],
                groupValue: radioValue,
                onChanged: (int value) {
                  this.setState(() {
                    radioValue = value;
                    form_items[count]['value'] = value;
                    _handleChanged();
                  });
                })
          ]));
        }
      }

      if (item['type'] == "Switch") {
        listWidget.add(
          Card(
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(children: <Widget>[
                new Expanded(child: new Text(item['title'])),
                new Switch(
                    value: item['switchValue'],
                    onChanged: (bool value) {
                      this.setState(() {
                        form_items[count]['switchValue'] = value;
                        _handleChanged();
                      });
                    })
              ]),
            ),
          ),
        );
      }

      if (item['type'] == "Checkbox") {
        //list_widget
        List forCheck = [];
        forCheck.add(new Container(
            margin: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Center(
              child: new Text(item['title'],
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0)),
            )));
        //ListView.builder(itemBuilder: (context,int index){},itemCount:  ,))

        for (var i = 0; i < item['list'].length; i++) {
          forCheck.add(new Row(children: <Widget>[
            new Expanded(
                child: new Text(form_items[count]['list'][i]['title'])),
            new Checkbox(
                value: form_items[count]['list'][i]['value'],
                onChanged: (bool value) {
                  this.setState(() {
                    form_items[count]['list'][i]['value'] = value;
                    _handleChanged();
                  });
                })
          ]));
        }
        listWidget.add(Card(
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return forCheck[index];
                },
                itemCount: forCheck.length,
              ),
            ),
          ),
        ));
      }
    }
    return listWidget;
  }

  _CoreFormState(this.form_items);

  void _handleChanged() {
    widget.onChanged(form_items);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(widget.padding ?? 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: JsonToForm(),
      ),
    );
  }
}
