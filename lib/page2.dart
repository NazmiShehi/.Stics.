import 'package:flutter/material.dart';
import 'package:flutter_application_1/calendar.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/page3.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:table_calendar/table_calendar.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DelayedDisplay(
                delay: Duration(seconds: 1),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Looking for your buddies...',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: DelayedDisplay(
                delay: Duration(seconds: 4),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Your buddies are currently offline',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
            ),
            DelayedDisplay(
              delay: Duration(seconds: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.red[300];
                      return Colors.yellow[800];
                    },
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Call them now',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.black54,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.red[300];
                      return Colors.yellow[800];
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => MyApp2()));
                },
                child: Text(
                  'Schedule a Call',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.black54,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
