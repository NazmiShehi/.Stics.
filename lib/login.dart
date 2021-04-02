import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stics/firebase_auth_service.dart';
import 'package:stics/splash.dart';
import 'page1.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Splash(),
            ),
          );
        },
        child: Icon(
          Icons.arrow_back_ios_rounded,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 900,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.purple[100], Colors.purple[200]])),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/pastelstics4.png'),
                  width: 120,
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.purple[300],
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
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          onChanged: (value) {
                            name = value;
                            print(password);
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
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          onChanged: (value) {
                            password = value;
                            print(password);
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            //  side: BorderSide(color: Colors.lightBlue)
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.purple[200];
                            }
                            return Colors.red[300];
                          },
                        ),
                      ),
                      onPressed: () {
                        //  context.read<AuthenticationService>().signIn(
                        //  email: emailController.text,.trim(),
                        //password: passwordController.text.trim(),
                        // );
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
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(
                          'Login',
                          style: GoogleFonts.nunito(
                            fontSize: 30,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            //  side: BorderSide(color: Colors.lightBlue)
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.purple[200];
                            }
                            return Colors.red[300];
                          },
                        ),
                      ),
                      onPressed: () {
                        //  context.read<AuthenticationService>().signIn(
                        //  email: emailController.text,.trim(),
                        //password: passwordController.text.trim(),
                        // );
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
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(
                          'Register',
                          style: GoogleFonts.nunito(
                            fontSize: 30,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
