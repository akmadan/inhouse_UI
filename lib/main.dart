import 'package:flutter/material.dart';
import 'package:i_scanner/models/user.dart';
import 'package:i_scanner/screens/home/pages/dashboard.dart';
import 'package:i_scanner/screens/home/pages/profile.dart';
// import 'package:i_scanner/screens/home/pages/home_page.dart';
import 'package:i_scanner/screens/wrapper.dart';
import 'package:i_scanner/services/auth.dart';
import 'package:provider/provider.dart';

// main function
void main() {
  runApp(MyApp()); // calling out app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark
        ),
        debugShowCheckedModeBanner: false,
        home: Profile(),                     //Wrapper
      ),
    );
  }
}
