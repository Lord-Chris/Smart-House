// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_house/ui/views/home_view.dart';
import 'package:wifi/wifi.dart';

import '../shared/constants.dart';

class WifiSelectionView extends StatefulWidget {
  const WifiSelectionView({Key key}) : super(key: key);

  @override
  State<WifiSelectionView> createState() => _WifiSelectState();
}

class _WifiSelectState extends State<WifiSelectionView> {
  StreamSubscription<List<WifiResult>> _sub;
  List<WifiResult> list = [];

  Stream<List<WifiResult>> func() async* {
    while (true) {
      try {
        await Future.delayed(const Duration(milliseconds: 500));
        list = await Wifi.list('');
        yield list;
      } on Exception catch (e) {
        log(e.toString());
      }
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Select Wifi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: StreamBuilder<List<WifiResult>>(
        stream: func(),
        builder: (context, snapshot) {
          return Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
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
                      contentPadding: const EdgeInsets.all(10),
                      onTap: () async {
                        try {
                          var result =
                              await Wifi.connection(list[index]?.ssid, '');
                          if (result != WifiState.success) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 3),
                                content: Text(
                                  "Error Connecting to ${list[index]?.ssid}",
                                ),
                              ),
                            );
                          }
                        } catch (e) {
                          log(e.toString());
                        }
                      },
                      title: Text(
                        list[index]?.ssid ?? 'Data',
                        style: const TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        list[index]?.level?.toString() ?? '2',
                        style: const TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Center(
              //   child: Padding(
              //     padding: EdgeInsets.all(40.0),
              //     child: FlatButton(
              //       padding:
              //           EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => Home()));
              //       },
              //       color: ORANGE,
              //       child: Text(
              //         'Sign Up',
              //         style: TextStyle(
              //           color: AppColors.beige,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
