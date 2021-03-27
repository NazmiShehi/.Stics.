import 'package:Stics/calendar.dart';
import 'page1.dart';
import 'index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  //CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page1()));
        },
        child: Icon(
          Icons.arrow_back_ios_rounded,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.red[300], Colors.yellow[700]],
          ),
        ),
        child: SafeArea(
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
                        color: Colors.white70,
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
                        color: Colors.white70,
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
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.yellow[700];
                        }
                        return Colors.red[300];
                      },
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IndexPage()));
                  },
                  child: Text(
                    'Call them now',
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
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
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.yellow[700];
                        }
                        return Colors.red[300];
                      },
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calendar()));
                  },
                  child: Text(
                    'Schedule a Call',
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              //    Container(
              //      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              //    height: 500,
              //   decoration: BoxDecoration(
              //   color: Colors.white,
              // borderRadius: BorderRadius.circular(6),
              // gradient:
              //   LinearGradient(colors: [Colors.red[50], Colors.red[300]]),
              //  boxShadow: [
              //  BoxShadow(color: Colors.black12, offset: Offset(0, 5)),
              //  ],
              //  ),
              //  child: TableCalendar(
              //  calendarController: _calendarController,
              // ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
