import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:i_scanner/services/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import '../../../models/user.dart';
import '../../../services/database.dart';
import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'package:i_scanner/main.dart';
// import 'package:i_scanner/screens/home/extras/view.dart';

// scanner app
class IScanner extends StatefulWidget {
  final User user;
  IScanner({this.user});
  @override
  _IScannerState createState() => _IScannerState();
}

class _IScannerState extends State<IScanner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.lightTheme,
      // theme: AppTheme.darkTheme,
      // theme: ThemeData.dark(),
      home: Home(user: widget.user), // calling home page
    );
  }
}

// home page for the app
class Home extends StatefulWidget {
  final User user;
  Home({this.user});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // object of AuthService
  final AuthService _auth = AuthService();
  //upload image to firebase
  FirebaseStorage _storage = FirebaseStorage.instance;
  //for getting userId
  final FirebaseAuth _auth2 = FirebaseAuth.instance;
  String uid;
  Future inputData() async {
    final FirebaseUser user = await _auth2.currentUser();
    uid = user.uid;
  }

  // build method
  @override
  Widget build(BuildContext context) {
    // for current size of the screen
    Size size = MediaQuery.of(context).size;
    // home page widget
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().currentMode,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Title goes here...',
            ),
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.person,
                ),
                label: Text(
                  'Logout',
                ),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
          drawer: SafeArea(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              child: Drawer(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: DrawerHeader(
                          child: Icon(
                            Icons.account_circle,
                            size: 100.0,
                          ),
                        ),
                      ),
                      Material(
                        // color: this.darkMode ? Colors.grey[900] : Colors.white,
                        child: InkWell(
                          onTap: () {
                            print("help");
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.help_outline,
                              size: 30,
                            ),
                            title: Text(
                              'Help',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        // color: this.darkMode ? Colors.grey[900] : Colors.white,
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Icon(
                              Icons.info_outline,
                              size: 30,
                            ),
                            title: Text(
                              'About us',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            child: Center(
              child: Text("Nothing's here..."),
            ),
          )),
    );
  }
}
