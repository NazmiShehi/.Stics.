import 'package:flutter/material.dart';
import 'page2.dart';
import 'package:table_calendar/table_calendar.dart';

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
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page2()));
        },
        child: Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image(
                  image: AssetImage('assets/stics4.png'),
                  width: 150,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  gradient:
                      LinearGradient(colors: [Colors.red[50], Colors.red[300]]),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, offset: Offset(0, 5)),
                  ],
                ),
                child: TableCalendar(
                  calendarController: _calendarController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
