import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page3.dart';
import 'page2.dart';
import 'login.dart';

class Buddy {
  String country = '';
  String name = '';
}

String welcomeText = '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.yellow[700], Colors.red[300]])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Image.asset('assets/stics4.png'),
                iconSize: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
              Container(
                height: 100,
              ),
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
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.red[300];
                              return Colors.yellow[800];
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Page2()),
                          );
                        },
                        child: Text(
                          'Join Your Buddies',
                          style: GoogleFonts.aBeeZee(
                            color: Colors.black54,
                            fontSize: 18,
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
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.red[300];
                              return Colors.yellow[800];
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Page3()),
                          );
                        },
                        child: Text(
                          'Make new friends',
                          style: GoogleFonts.aBeeZee(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 100,
              ),
              Text(
                '$welcomeText',
                style: GoogleFonts.aBeeZee(
                  color: Colors.yellow[700],
                  fontSize: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
