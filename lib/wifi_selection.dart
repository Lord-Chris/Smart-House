import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_house/home.dart';
import 'package:wifi/wifi.dart';

import 'constants.dart';

class WifiSelect extends StatefulWidget {
  @override
  _WifiSelectState createState() => _WifiSelectState();
}

class _WifiSelectState extends State<WifiSelect> {
  StreamSubscription<List<WifiResult>> _sub;
  List<WifiResult> list = [];
  Stream<List<WifiResult>> func() async* {
    // String ssid = await Wifi.ssid;

    // //Signal strength， 1-3，The bigger the number, the stronger the signal
    // int level = await Wifi.level;

    // String ip = await Wifi.ip;

    // var result = await Wifi.connection('ssid', 'password');

    // only work on Android.
    try {
      while (true) {
        await Future.delayed(Duration(milliseconds: 300));

        list = await Wifi.list('');
        print(list);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    _sub = func().listen((event) {});
    super.initState();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // func();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // toolbarHeight: 70,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Select Wifi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: StreamBuilder<List<WifiResult>>(
            stream: func(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Select a wifi network to continue',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (__, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.all(10),
                          onTap: () async {
                            try {
                              var result =
                                  await Wifi.connection(list[index]?.ssid, '');
                              if (result == WifiState.success) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 3),
                                    content: Text(
                                        "Error Connecting to ${list[index]?.ssid}"),
                                  ),
                                );
                              }
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          title: Text(
                            list[index]?.ssid ?? 'Data',
                            style: TextStyle(
                              color: BLUE,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          trailing: Text(
                            list[index]?.level?.toString() ?? '2',
                            style: TextStyle(
                              color: BLUE,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        color: ORANGE,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: BEIGE,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class WifiNetWork {
  final String name;
  final String password;

  WifiNetWork({this.name, this.password});
}
