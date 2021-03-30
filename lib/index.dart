import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple[200],
              Colors.teal[200],
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DelayedDisplay(
                    delay: Duration(seconds: 1),
                    fadingDuration: Duration(seconds: 1),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Image(
                        image: AssetImage('assets/twobuddies.png'),
                        height: 150,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                  ),
                  DelayedDisplay(
                    delay: Duration(
                      seconds: 2,
                    ),
                    fadingDuration: Duration(seconds: 1),
                    child: Text(
                      'Are you ready to meet your new buddies?',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: DelayedDisplay(
                      delay: Duration(seconds: 4),
                      fadingDuration: Duration(seconds: 1),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: TextField(
                                controller: _channelController,
                                decoration: InputDecoration(
                                    errorText: _validateError
                                        ? 'Don\' t forget to put you buddy group name here'
                                        : null,
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    hintText:
                                        'How\'s your budddy group called?',
                                    hintStyle: TextStyle(
                                        color: Colors.white70, fontSize: 18)),
                                style: TextStyle(color: Colors.white70),
                              ))
                            ],
                          ),
                          Column(
                            children: [
                              Opacity(
                                opacity: 0,
                                child: ListTile(
                                  title: Stack(
                                    children: [
                                      Text(
                                        'Are you ready?',
                                        style: TextStyle(
                                          color: Colors.white70,
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ElevatedButton(
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
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
