import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';

class Page2 extends StatelessWidget {
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
                        return Colors.purple[300];
                      return Colors.yellow[700];
                    },
                  ),
                ),
                onPressed: () {},
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
                      if (states.contains(MaterialState.pressed))
                        return Colors.purple[300];
                      return Colors.yellow[700];
                    },
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Schedule a Call',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            // CircularProgressIndicator(
            //  valueColor: AlwaysStoppedAnimation(
            //  Colors.purple[300],
            // ),
            // backgroundColor: Colors.yellow[700],
            //  ),
          ],
        ),
      ),
    );
  }
}
