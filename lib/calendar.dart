import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:stics/page1.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page1()),
          );
        },
        child: Icon(Icons.check),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red[200],
              Colors.purple[200],
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DelayedDisplay(
                delay: Duration(seconds: 1),
                fadingDuration: Duration(seconds: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                      child: Text(
                        'When do you want to meet your buddies next time?',
                        style: GoogleFonts.nunito(
                          color: Colors.white70,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.red[200], Colors.white70],
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12, offset: Offset(0, 5)),
                        ],
                      ),
                      child: TableCalendar(
                        calendarController: _calendarController,
                      ),
                    ),
                    //TODO put your parent's e-mail so we can notify them
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            hintStyle: new TextStyle(color: Colors.white70),
                            hintText: "Type in your parent's e-mail",
                            fillColor: Colors.white70),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
