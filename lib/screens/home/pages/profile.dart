import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_scanner/widgets/drawer.dart';
import 'package:i_scanner/widgets/profileitem.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      drawer: drawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0),
            height: 250,
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                    '331091_John',
                    style: GoogleFonts.poppins(fontSize: 18.0),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.0)),
                  Text(
                    'Information Technology',
                    style: GoogleFonts.poppins(fontSize: 16.0),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.0)),
                  Text(
                    'TE-09 2020-21',
                    style: GoogleFonts.poppins(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            height: 250,
            child: Column(
              children: [
                profileitem(
                  icon: Icons.mail,
                  texttitle: "Email",
                  textitem: "John@gmail.com",
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                profileitem(
                  icon: Icons.phone,
                  texttitle: "Contact",
                  textitem: "95454356743",
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                profileitem(
                  icon: Icons.contact_page,
                  texttitle: "College ID",
                  textitem: "I2K4574395",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
