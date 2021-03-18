import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatelessWidget {
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
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Discover',
              style: GoogleFonts.aBeeZee(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
