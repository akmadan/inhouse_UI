import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              accountName: Text('33110_John', style: GoogleFonts.poppins()),
              accountEmail: Text('I2K12345678', style: GoogleFonts.poppins())),
          ListTile(
            title: Text(
              'General',
              style: GoogleFonts.poppins(
                  fontSize: 24.0, fontWeight: FontWeight.w400),
            ),
          ),
          Divider(),

          //****************************************************************/

          ListTile(
            title: Text('Subjects', style: GoogleFonts.poppins()),
          ),
          ListTile(
            title: Text('Time Table', style: GoogleFonts.poppins()),
          ),
          ListTile(
            title: Text('Calender', style: GoogleFonts.poppins()),
          ),
          ListTile(
            title: Text('Attendence', style: GoogleFonts.poppins()),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: GoogleFonts.poppins(
                  fontSize: 24.0, fontWeight: FontWeight.w400),
            ),
          ),

          //****************************************************************/

          Divider(),
          ListTile(
            title: Text('Notifications', style: GoogleFonts.poppins()),
          ),
          ListTile(
            title: Text('Profile', style: GoogleFonts.poppins()),
          ),
          ListTile(
            title: Text('Add Account', style: GoogleFonts.poppins()),
          ),
          ListTile(
            title: Text('Logout', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }
}
