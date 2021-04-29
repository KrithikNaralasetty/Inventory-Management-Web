import 'package:flutter/material.dart';

class ItemsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ItemsPageState();
  }
}

class ItemsPageState extends State<ItemsPage> {

  var boxdecor = BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(offset: Offset(0, 10.0), color: Colors.grey, blurRadius: 10.0)
      ]);
  var data = [
    {
      "dos": "12/10/2016",
      "worker": "Alpha",
      "uid": "mechazpo1234a",
      "working": true,
    },
    {
      "dos": "12/9/2016",
      "worker": "Beta",
      "uid": "mechazpo1234b",
      "working": false,
    },
    {
      "dos": "12/8/2016",
      "worker": "Gamma",
      "uid": "mechazpo1234c",
      "working": true,
    },
    {
      "dos": "12/10/2016",
      "worker": "Delta",
      "uid": "mechazpo1234d",
      "working": false,
    },
    {
      "dos": "12/10/2016",
      "worker": "Omega",
      "uid": "mechazpo1234e",
      "working": true,
    },
    {
      "dos": "12/10/2016",
      "worker": "Epsilon",
      "uid": "mechazpo1234f",
      "working": false,
    },
    {
      "dos": "12/10/2016",
      "worker": "Pho",
      "uid": "mechazpo1234g",
      "working": true,
    },
    {
      "dos": "12/10/2016",
      "worker": "Gelapha",
      "uid": "mechazpo1234h",
      "working": false,
    },
  ];

  @override
  void initState() { 
    super.initState();
  }

  Widget getIcon(bool val){
    if (val){
      return Container(
        child: Center(child: Icon(Icons.assignment_turned_in,color: Colors.green,),),
      );
    }
    else{
      return Container(
        child: Center(child: Icon(Icons.assignment_late,color: Colors.red,),),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text("Home Page"),
          backgroundColor: Color(0xFF002894),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.05,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration: boxdecor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                            child: Text(
                          "Number of Machines Installed",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        )),
                      ),
                      Expanded(
                        child: Center(child: Text("57",style: TextStyle(fontSize: 40.0),),),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: MediaQuery.of(context).size.width * 0.5 -
                    MediaQuery.of(context).size.width * 0.09,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration: boxdecor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                            child: Text(
                          "Number of Machines Working",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        )),
                      ),
                      Expanded(
                        child: Center(child: Text("4",style: TextStyle(fontSize: 40.0),),),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: Container(
                  decoration: boxdecor,
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                            child: Text(
                          "Number of Records",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        )),
                      ),
                      Expanded(
                        child: Center(child: Text("8",style: TextStyle(fontSize: 40.0),),),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6DADA),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Center(child: Text(data[index]["dos"]),),
                            ),
                            Expanded(
                              child: Center(child: Text(data[index]["worker"]),),
                            ),
                            Expanded(
                              child: Center(child: Text(data[index]["uid"]),),
                            ),
                            Expanded(
                              child: Center(child: Text("Not Completed"),),
                            ),
                            Expanded(
                              child: Center(child: getIcon(data[index]["working"]),),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10.0,
                      );
                    },
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
              )
            ],
          ),
        ));
  }
}