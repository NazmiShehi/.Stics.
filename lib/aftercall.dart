import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:stics/calendar.dart';
import 'package:stics/login.dart';
import 'package:stics/page3.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterCall extends StatefulWidget {
  @override
  _AfterCallState createState() => _AfterCallState();
}

class _AfterCallState extends State<AfterCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.red[200], Colors.purple[200]])),
        child: SafeArea(
          child: Column(
            children: [
              DelayedDisplay(
                delay: Duration(seconds: 1),
                fadingDuration: Duration(seconds: 1),
                child: Image(
                  image: AssetImage('assets/buddyt.png'),
                  width: 180,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: DelayedDisplay(
                    delay: Duration(seconds: 2),
                    fadingDuration: Duration(seconds: 1),
                    child: Text(
                      'Hey $name, what do you feel like doing now?',
                      style: GoogleFonts.nunito(
                        fontSize: 25,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 10),
                child: DelayedDisplay(
                  delay: Duration(seconds: 4),
                  fadingDuration: Duration(seconds: 1),
                  child: TextButton(
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
                        MaterialPageRoute(builder: (context) => Calendar()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                      child: Text(
                        'Fix the next meeting       with my buddies',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: 4),
                fadingDuration: Duration(seconds: 1),
                child: TextButton(
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
                      MaterialPageRoute(builder: (context) => Page3()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Text(
                      'Make new friends!',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 20,
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
