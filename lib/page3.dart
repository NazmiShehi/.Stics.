import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
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
                      color: Colors.white,
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
                delay: Duration(seconds: 3),
                child: Text(
                  'Your first buddy is:',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 30,
                    color: Colors.white,
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
