import 'package:flutter/material.dart';
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
                  colors: [Colors.purple[200], Colors.teal[200]])),
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
                            labelStyle: TextStyle(
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
                            labelStyle: TextStyle(
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
                              return Colors.yellow[700];
                            }
                            return Colors.red[300];
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
                          style: TextStyle(
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
