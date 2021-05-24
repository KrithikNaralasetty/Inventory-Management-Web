import 'dart:ui';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inventory_management_web/Data/ColorData.dart';
import 'package:inventory_management_web/Data/TablesData.dart' as data;
import 'MainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double height, width;
  String _title = "Form Field";
  var users = data.admins;
  String _username, _password;
  // ignore: unused_field
  bool _usernameVal;
  int _usernameIndex;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromARGB(255, 31, 27, 62);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          this._title,
          style: TextStyle(
            color: textColor,
            fontFamily: "FiraSans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: height * 0.05,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Row(children: [
        //App Download Link Side
        Expanded(
          flex: 5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/Images/logo_1.jpg",
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
                height: height * 0.6,
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
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontFamily: "FiraSans",
                            color: textColor,
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
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontFamily: "FiraSans",
                          color: textColor,
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
                              color: iconColor,
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
                              color: iconColor,
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
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontFamily: "FiraSans",
                            color: textColor,
                            fontSize: height * 0.06,
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
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                  fontFamily: "FiraSans",
                                  fontSize: 30.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            //Text Field (Username)
                            Container(
                              child: TextField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: textColor,
                                      fontFamily: "FiraSans"),
                                  hintText: "Enter Username",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (username) {
                                  setState(() {
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
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: textColor,
                                    fontFamily: "FiraSans",
                                  ),
                                  hintText: "Enter Password",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (password) {
                                  setState(() {
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
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                              fontSize: 26.0,
                              fontFamily: "FiraSans",
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => this.getColor(states))),
                          onPressed: () {
                            _usernameVal = false;
                            int n = users["uname"].length;
                            for (var i = 0; i < n; i++) {
                              if (users["uname"][i] == _username) {
                                _usernameVal = true;
                                _usernameIndex = i;
                                break;
                              }
                            }
                            if (_usernameVal == true) {
                              var x = users["psswd"][_usernameIndex];
                              debugPrint("$x");
                              if ("$x" == _password) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MainPage(_username);
                                }));
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error in Credentials"),
                                    content: Text(
                                        "Entered Wrong Password/Username or both. Please Enter the correct Values"),
                                    actions: [
                                      TextButton(
                                        child: Text("Close"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
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
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: textColor),
                              ),
                            ),
                            // Icon (Twitter)
                            Expanded(
                                child: Icon(
                              Icons.account_balance,
                              color: iconColor,
                            )),
                            //Icon (Facebook)
                            Expanded(
                              child: Icon(
                                Icons.query_builder_rounded,
                                color: iconColor,
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
        backgroundColor: primary,
        child: Icon(
          Icons.question_answer_rounded,
          color: iconColor,
        ),
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: primary,
                    title: Text(
                      "Want to know more about the application? or have issues to report?\nMessage us on our project board",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                        fontSize: 20.0,
                        fontFamily: "FiraSans",
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          html.window.open(
                              "https://github.com/KrithikNaralasetty/Inventory-Management-Web/issues",
                              "Issues/Review");
                        },
                        icon: Icon(
                          Icons.open_in_browser_rounded,
                          color: iconColor,
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
