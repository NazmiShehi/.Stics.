import 'dart:html';

import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        child: Center(
          child: Text(
            'Page2',
          ),
        ),
      ),
    );
  }
}
