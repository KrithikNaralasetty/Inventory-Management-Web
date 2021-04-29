import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './itemspage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Portal',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Welcome to Form Field'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _password, _username;
  bool _passwordVal, _usernameVal;
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 27, 62),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "FiraSans",
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            fontSize: height * 0.05,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 31, 27, 62),
      ),
      body: Row(children: [
        //App Download Link Side
        Expanded(
          flex: 5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/Images/02_formfield.jpg",
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              //Text (About the Mobile Application)
              Container(
                height: height *0.6,
                width: width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Text (Newly joined worker?)
                    Expanded(
                      child: Center(
                        child: Text(
                          "Newly joined Worker/Inspector?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontFamily: "FiraSans",
                            color: Colors.white,
                            fontSize: height * 0.08,
                          ),
                        ),
                      ),
                    ),
                    //Text (Please follow the links below to download the mobile application to start inspecting the machines.)
                    Expanded(
                      child: Text(
                        "Please click on the icons below to download the respective application files as per your choice of OS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          fontFamily: "FiraSans",
                          color: Colors.white,
                          fontSize: height * 0.04,
                        ),
                      ),
                    ),
                    //Row (Two links (Android Download APK) (IOS Download APK))
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Play Store Icon
                          IconButton(
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                            iconSize: height * 0.1,
                            onPressed: () {
                              html.window
                                  .open("https://www.google.com", "_defined");
                            },
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          //App Store Icon
                          IconButton(
                            icon: Icon(
                              Icons.shopping_basket_rounded,
                              color: Colors.white,
                            ),
                            iconSize: height * 0.1,
                            onPressed: () {
                              html.window
                                  .open("https://www.google.com", "_defined");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        //Login Credentials Side
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Logo and Information about the Application
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Already an Existing Admin?",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontFamily: "FiraSans",
                            color: Colors.white,
                            fontSize: height * 0.06,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Lorem Ipsum De Facto",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w200,
                            fontFamily: "FiraSans",
                            color: Colors.white,
                            fontSize: height * 0.04,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Lorem Ipsum De Facto ",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w200,
                            fontFamily: "FiraSans",
                            color: Colors.white,
                            fontSize: height * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Login Box
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    //Login Credentials Area
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: width * 0.1, left: width * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Text (Admin Login)
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Admin Login",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                  fontFamily: "FiraSans",
                                  fontSize: 30.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            //Text Field (Username)
                            Container(
                              child: TextField(
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey[400],
                                        fontFamily: "FiraSans"),
                                    hintText: "Enter Username",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)),),
                                onChanged: (username) {
                                  setState(() {
                                    _usernameVal = true;
                                    _username = username;
                                    debugPrint(_username);
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            //Text Field (Password)
                            Container(
                              child: TextField(
                                obscureText: true,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.grey[400],
                                      fontFamily: "FiraSans",
                                    ),
                                    hintText: "Enter Password",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)),),
                                onChanged: (password) {
                                  setState(() {
                                    _passwordVal = true;
                                    _password = password;
                                    debugPrint(_password);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Login Button
                    Expanded(
                        flex: 1,
                        child: TextButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                              fontSize: 26.0,
                              fontFamily: "FiraSans",
                            ),
                          ),
                          onPressed: () {
                            if (_username == "FormField" && _password == "12345678") {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ItemsPage();
                              }));
                            }
                          },
                        ))
                  ],
                ),
              ),
              //Social Media Contacts
              Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.3,
                        child: Row(
                          children: [
                            //Text ("Follow us on")
                            Expanded(
                              child: Text(
                                "Follow Us On",
                                style: TextStyle(
                                    fontFamily: "FiraSans",
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white),
                              ),
                            ),
                            // Icon (Twitter)
                            Expanded(
                                child: Icon(
                              Icons.account_balance,
                              color: Colors.white,
                            )),
                            //Icon (Facebook)
                            Expanded(
                              child: Icon(
                                Icons.query_builder_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
            ],
          ),
        ),
      ]),
      //Alert Dialog Box (Review redirect)
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 77, 99, 172),
        child: Icon(
          Icons.question_answer_rounded,
          color: Color.fromARGB(255, 140, 155, 204),
        ),
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Color.fromARGB(255, 31, 27, 62),
                    title: Text(
                      "Want to know more about the application?\nMessage us on our website",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: "FiraSans",
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          html.window.open("https://www.google.com", "Review");
                        },
                        icon: Icon(
                          Icons.open_in_browser_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  );
                });
          });
        },
      ),
    );
  }
}
