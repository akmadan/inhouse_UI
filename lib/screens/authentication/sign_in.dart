import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_scanner/screens/home/shared/loading.dart';
import 'package:i_scanner/services/auth.dart';
import 'package:i_scanner/screens/home/shared/constants.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              // backgroundColor: Colors.redAccent,
              elevation: 0.0,
              title: Text(
                'Sign in',
                style: GoogleFonts.poppins(),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text(
                    'Register',
                    style: GoogleFonts.poppins(),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
              ],
            ),

            //----------------------------------------------------------

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

                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton.icon(
                          onPressed: () async {
                            setState(() => loading = true);
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print('error signing in');
                              setState(() => loading = true);
                            } else {
                              print('sign in successful');
                              print(result.uid);
                            }
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            // color: Colors.red,
                          ),
                          label: Text('Skip sign-in',
                              style: GoogleFonts.poppins(fontSize: 15))),
                    )),

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
                          'Sign in',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
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

                    Container(child: Lottie.asset('assets/login.json')),
                  ],
                ),
              ),
            ),
          );
  }
}
