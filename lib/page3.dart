import 'package:stics/index.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:stics/page1.dart';
import 'login.dart';
import 'package:google_fonts/google_fonts.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page1()),
          );
        },
        child: Icon(Icons.arrow_back),
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 30, 30),
                child: Align(
                  alignment: Alignment.center,
                  child: DelayedDisplay(
                    delay: Duration(seconds: 1),
                    child: Text(
                      'Looking for buddies from all over the world...',
                      style: GoogleFonts.nunito(
                        fontSize: 30,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),

              // Align(
              // alignment: Alignment.center,
              // child: DelayedDisplay(
              //  delay: Duration(seconds: 4),
              //  child: Text(
              //  'Your first buddy is:',
              // style: GoogleFonts.aBeeZee(
              //  fontSize: 30,
              // color: Colors.black54,
              //  ),
              //     ),
              //  ),
              //  ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: DelayedDisplay(
                  delay: Duration(seconds: 6),
                  child: Text(
                    'Hey $name, your new buddies are waiting for you!',
                    style: GoogleFonts.nunito(
                      color: Colors.white70,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              DelayedDisplay(
                delay: Duration(seconds: 8),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        //  side: BorderSide(color: Colors.lightBlue)
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
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
                      MaterialPageRoute(builder: (context) => IndexPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Text(
                      'Let\'s Start!',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
