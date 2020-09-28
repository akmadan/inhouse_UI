import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class profileitem extends StatelessWidget {
  final IconData icon;
  final String texttitle;
  final String textitem;

  const profileitem({Key key, this.icon, this.textitem, this.texttitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon,size: 30,),
        Padding(padding: EdgeInsets.only(left: 17.0)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              texttitle,
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            Text(
              textitem,
              style: GoogleFonts.poppins(fontSize: 18),
            )
          ],
        )
      ],
    ));
  }
}
