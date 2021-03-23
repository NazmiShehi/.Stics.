import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  CalendarController _controller = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: TableCalendar(
          calendarController: _controller,
        ),
      ),
    );
  }
}
