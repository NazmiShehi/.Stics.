import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:stics/calendar.dart';
import 'package:stics/login.dart';
import 'package:stics/page3.dart';

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
        height: 900,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.purple[200], Colors.teal[200]])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DelayedDisplay(
                delay: Duration(seconds: 1),
                fadingDuration: Duration(seconds: 1),
                child: Image(
                  image: AssetImage('assets/buddyt.png'),
                  width: 180,
                ),
              ),
              Container(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DelayedDisplay(
                    delay: Duration(seconds: 2),
                    fadingDuration: Duration(seconds: 1),
                    child: Text(
                      'Hey $name, what do you feel like doing now?',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Container(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DelayedDisplay(
                  delay: Duration(seconds: 4),
                  fadingDuration: Duration(seconds: 1),
                  child: TextButton(
                    style: ButtonStyle(
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
                    child: Text(
                      'Fix the next meeting with my buddies',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: 4),
                fadingDuration: Duration(seconds: 1),
                child: TextButton(
                  style: ButtonStyle(
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
                  child: Text(
                    'Make new friends!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
