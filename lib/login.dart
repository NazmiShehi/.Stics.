import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page1.dart';

String name = '';
String password = '';
bool logged = false;
bool boyTapped = false;
bool girlTapped = false;
var color = Colors.yellow;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 900,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.yellow[700], Colors.red[300]])),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/stics.png'),
                  width: 150,
                ),
                Container(
                  height: 100,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.yellow[700],
                          child: Image.asset(
                            'assets/budd1.png',
                            width: 45,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.red[300],
                          child: Image.asset(
                            'assets/buddy.png',
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Username',
                            labelStyle: GoogleFonts.aBeeZee(
                              color: Colors.white70,
                            ),
                          ),
                          onChanged: (text) {
                            name = text;
                            print(name);
                            buddies.add(name);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Password',
                            labelStyle: GoogleFonts.aBeeZee(
                              color: Colors.white70,
                            ),
                          ),
                          onChanged: (text) {
                            password = text;
                            print(password);
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.red[300];
                            }
                            return Colors.yellow[700];
                          },
                        ),
                      ),
                      onPressed: () {
                        print(buddies);
                        if (name.isNotEmpty) {
                          welcomeText = 'Welcome $name!';
                          if (password.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Page1()));
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Login',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 30,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
