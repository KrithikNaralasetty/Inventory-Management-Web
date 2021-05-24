import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/ColorData.dart';
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'package:inventory_management_web/PageViews/LocatorTool.dart';
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';
import 'package:inventory_management_web/PageViews/Pages/AddMachinePage.dart';

class MachinesPage extends StatefulWidget {
  MachinesPage({Key key}) : super(key: key);
  _MachinesPageState createState() => _MachinesPageState();
}

class _MachinesPageState extends State<MachinesPage> {
  var mechs = data.machines;

  List<Widget> get_list_machines() {
    List<Widget> mcs = [];
    var m = data.machines;
    int len = m.length;
    for (var i = 0; i < len; i++) {
      mcs.add(
        ListTile(
          leading: Icon(
            Icons.settings_sharp,
            color: iconColor,
          ),
          title: InkWell(
            child: Text(
              m[i].model.toString(),
              style: textSt,
            ),
            onLongPress: () {
              var content_string = "Serial No:" +
                  m[i].sno.toString() +
                  "\nEquipment : " +
                  m[i].eqtype.toString() +
                  "\nBrand: " +
                  m[i].brand.toString() +
                  "\nDate of Installation: " +
                  m[i].doi.toString() +
                  "\nMachine Id: " +
                  m[i].uid.toString() +
                  "\nTemplate Name: " +
                  m[i].tname.toString();
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      title: Text(
                        m[i].model.toString(),
                        style: textSt,
                      ),
                      content: SingleChildScrollView(
                        child: Text(
                          content_string,
                          style: TextStyle(
                            fontFamily: "FiraSans",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
          subtitle: Text(
            m[i].doi.toString(),
            style: textSt,
          ),
        ),
      );
    }
    return mcs;
  }

  Widget build(BuildContext context) {
    Widget mc_list = Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  pageLocator<PageNavigationService>().goBack();
                  pageLocator<PageNavigationService>()
                      .navigateTo(overviewPageRoute);
                },
              )),
              Expanded(
                flex: 8,
                child: Center(
                  child: Text(
                    "List of Machines",
                    style: TextStyle(
                      color: primary,
                      fontFamily: "FiraSans",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Icon(
                Icons.replay_outlined,
                color: Colors.black,
              ))
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: ListView(
            children: get_list_machines(),
          ),
        )
      ],
    );
    return SafeArea(
      child: Row(
        children: [
          Expanded(child: mc_list),
          Expanded(child: MachinePage("Alpha", "123456789")),
        ],
      ),
    );
  }
}
