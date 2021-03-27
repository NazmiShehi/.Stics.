import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red[300],
              Colors.yellow[700],
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: DelayedDisplay(
                    delay: Duration(seconds: 1),
                    child: Text(
                      'Looking for buddies from all over the world...',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 30,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: DelayedDisplay(
                  delay: Duration(seconds: 4),
                  child: Text(
                    'Your first buddy is:',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 30,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              //  TextButton(
              //  onPressed: () {},
              //child: Text(
              //'Let\'s Start!',
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
