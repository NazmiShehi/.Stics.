import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'page2.dart';
import 'page3.dart';
import 'package:firebase_auth/firebase_auth.dart';

String welcomeText = '';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  // final _auth = FirebaseAuth.instance;
  // User loggedInUser;

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple[100], Colors.purple[200]])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Image.asset('assets/pastelstics4.png'),
                iconSize: 120,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/buddies4.png'),
                        width: 150,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              //  side: BorderSide(color: Colors.lightBlue)
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.purple[200];
                              }
                              return Colors.red[300];
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page2()),
                          );
                        },
                        child: Text(
                          'Join Your Buddies',
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/buddy.png'),
                        width: 150,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              //  side: BorderSide(color: Colors.lightBlue)
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.purple[200];
                              }
                              return Colors.red[300];
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page3()),
                          );
                        },
                        child: Text(
                          'Make new friends',
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DelayedDisplay(
                      delay: Duration(seconds: 1),
                      fadingDuration: Duration(seconds: 1),
                      child: Text(
                        '$welcomeText',
                        style: GoogleFonts.nunito(
                          fontSize: 25,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.transparent,
                  //   child: Image.asset(''),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
