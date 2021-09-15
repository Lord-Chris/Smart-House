import 'package:flutter/material.dart';
import 'package:smart_house/home.dart';
import 'package:wifi/wifi.dart';

import 'constants.dart';

class WifiSelect extends StatefulWidget {
  @override
  _WifiSelectState createState() => _WifiSelectState();
}

class _WifiSelectState extends State<WifiSelect> {
  List<WifiResult> list = [];
  func() async {
    // String ssid = await Wifi.ssid;

    // //Signal strength， 1-3，The bigger the number, the stronger the signal
    // int level = await Wifi.level;

    // String ip = await Wifi.ip;

    // var result = await Wifi.connection('ssid', 'password');

    // only work on Android.
    try {
      list = await Wifi.list('');
      setState(() {});
      print(list);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    func();
    return Scaffold(
      backgroundColor: BEIGE,
      appBar: AppBar(
        // toolbarHeight: 70,
        backgroundColor: GREEN,
        title: Text(
          'Select Wifi',
          style: TextStyle(
            color: ORANGE,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ORANGE,
          onPressed: () {},
        ),
      ),
      body: Container(
        child: Column(
          children: [
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
                      } on Exception catch (e) {
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
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
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
        ),
      ),
    );
  }
}

class WifiNetWork {
  final String name;
  final String password;

  WifiNetWork({this.name, this.password});
}
