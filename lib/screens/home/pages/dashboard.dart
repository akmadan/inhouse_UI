import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_scanner/widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List tasks = ['Assignments', 'Calender', 'Announcements', 'Videos & Files'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //****************************************************************/

      drawer:drawer(),

      //****************************************************************/

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(),
        ),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Container(
              height: 70,
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
            Container(
                width: MediaQuery.of(context).size.width,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    GridTile(
                        child: Container(
                      child: Text(tasks[0]),
                    ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
