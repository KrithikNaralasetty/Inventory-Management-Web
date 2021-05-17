import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchMenu extends StatefulWidget {
  final String username;
  SearchMenu({Key key, this.username}) : super(key: key);

  _SearchMenu createState() => _SearchMenu(this.username);
}

class _SearchMenu extends State<SearchMenu> {
  String username,srcData;
  _SearchMenu(this.username);


  // ignore: unused_element
  Future _getMachines(srcData) async{
    Future machines;
    return machines;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Icon(Icons.search),
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: "Search",
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
            onChanged: (search){
              debugPrint(search);
              this.srcData = search;
            },
          ),
        ),
      ],
    );
  }
}
