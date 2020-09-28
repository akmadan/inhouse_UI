import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //****************************************************************/

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                accountName: Text('33110_John', style: GoogleFonts.poppins()),
                accountEmail:
                    Text('I2K12345678', style: GoogleFonts.poppins())),
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
      ),

      //****************************************************************/

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(),
        ),
      ),

      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TIMELINE',
                    style: GoogleFonts.poppins(fontSize: 16.0),
                  ),
                  Text(
                    'Tue, Sept 22, 2020',
                    style: GoogleFonts.poppins(),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
            ),
            // GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2),
            //     itemBuilder: (context, index) {
            //       return GridTile(child: null);
            //     }),
          ],
        ),
      ),
    );
  }
}
