import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_rounded),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.yellow[700],
              Colors.red[300],
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 400,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: TextField(
                            controller: _channelController,
                            decoration: InputDecoration(
                                errorText: _validateError
                                    ? 'Channel name is mandatory'
                                    : null,
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                                hintText: 'How\'s your budddy group called?'),
                            style: TextStyle(color: Colors.white70),
                          ))
                        ],
                      ),
                      Column(
                        children: [
                          ListTile(
                            title: Stack(
                              children: [
                                Text(
                                  'Are you ready?',
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  ClientRole.Broadcaster.toString(),
                                  style: TextStyle(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            leading: Radio(
                              value: ClientRole.Broadcaster,
                              groupValue: _role,
                              onChanged: (ClientRole value) {
                                setState(() {
                                  _role = value;
                                });
                              },
                            ),
                          ),
                          //  ListTile(
                          //  title: Text(ClientRole.Audience.toString()),
                          //leading: Radio(
                          //value: ClientRole.Audience,
                          //groupValue: _role,
                          //onChanged: (ClientRole value) {
                          //setState(() {
                          //_role = value;
                          //});
                          //  },
                          // ),
                          // ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.yellow[700];
                                      }
                                      return Colors.red[300];
                                    },
                                  ),
                                ),
                                onPressed: onJoin,
                                child: Text(
                                  'Join your buddies',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
