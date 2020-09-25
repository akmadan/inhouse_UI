import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_scanner/screens/home/shared/loading.dart';
import 'package:i_scanner/services/auth.dart';
import 'package:i_scanner/screens/home/shared/constants.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //backgroundColor: Colors.grey[200],
            appBar: AppBar(
              elevation: 0.0,
              title: Text('Sign up', style: GoogleFonts.poppins()),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign in', style: GoogleFonts.poppins()),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: ListView(
                  reverse: true,
                  children: [
                    //----------------------------------------------------------
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(fontSize: 14.0),
                    ),

                    //----------------------------------------------------------
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Color(0xff7289da),
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Invalid credentials';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                    ),

                    //----------------------------------------------------------

                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                    ),
                    Positioned(
                      bottom: 10.0,
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              labelText: "Enter password",
                              labelStyle: GoogleFonts.poppins()),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                    ),

                    //----------------------------------------------------------

                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                    ),
                    Positioned(
                      bottom: 10.0,
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              labelText: "Enter email",
                              labelStyle: GoogleFonts.poppins()),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                    ),

                    //----------------------------------------------------------

                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),

                    //-------------------------------------------------------

                    Container(child: Lottie.asset('assets/register.json')),
                  ],
                ),
              ),
            ),
            // child: Form(
            //   key: _formKey,
            //   child: Column(
            //     children: <Widget>[
            //       SizedBox(height: 20.0),
            //       TextFormField(
            //           decoration:
            //               textInputDecoration.copyWith(hintText: 'Email'),
            //           validator: (val) =>
            //               val.isEmpty ? 'Enter an email' : null,
            //           onChanged: (val) {
            //             setState(() => email = val);
            //           }),
            //       SizedBox(height: 20.0),
            //       TextFormField(
            //           decoration: textInputDecoration.copyWith(
            //               hintText: 'Password'),
            //           obscureText: true,
            //           validator: (val) => val.length < 6
            //               ? 'Enter a password 6+ chars long'
            //               : null,
            //           onChanged: (val) {
            //             setState(() => password = val);
            //           }),
            //       SizedBox(height: 20.0),
            //       RaisedButton(
            //         color: Colors.blue[300],
            //         child: Text(
            //           'Register',
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //         ),
            // onPressed: () async {
            //   if (_formKey.currentState.validate()) {
            //     setState(() => loading = true);
            //     dynamic result = await _auth
            //         .registerWithEmailAndPassword(email, password);
            //     if (result == null) {
            //       setState(() {
            //         error = 'Invalid credentials';
            //         loading = false;
            //       });
            //     }
            //   }
            // },
            //       ),
            //       SizedBox(height: 12.0),
            //       Text(
            //         error,
            //         style: TextStyle(fontSize: 14.0),
            //       ),
            //     ],
            //   ),
            // )
          );
  }
}
