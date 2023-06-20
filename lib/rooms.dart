import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';

class Rooms extends StatelessWidget {
  final String room;

  final List<String> applian = [
    'TV',
    'AC (Temp: ${(Random().nextDouble() * 10).toStringAsFixed(1)}`C)',
    'Fan (Level: ${Random().nextInt(5)})',
    'Socket 1',
    'Socket 2',
  ];

  Rooms({Key key, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        // toolbarHeight: 70,
        backgroundColor: BLUE,
        title: Text(
          room,
          style: TextStyle(
            color: WHITE,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (__, index) {
            return Card(
              margin: EdgeInsets.all(8),
              color: BLUE.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: BLUE.withOpacity(0.7),
                      child: Icon(
                        Icons.lightbulb,
                        color: WHITE,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            applian[index],
                            style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              color: WHITE,
                            ),
                          ),
                          Divider(color: BEIGE, thickness: 2),
                          Text(
                            'Off since: ${Random().nextInt(5)} hrs',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: WHITE,
                            ),
                          ),
                          Text(
                            'Power Saved: ${Random().nextInt(20)} kW',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: WHITE,
                            ),
                          ),
                          // Text(
                          //   'AC temperature: 27`C',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontStyle: FontStyle.italic,
                          //     color: WHITE,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {},
                          color: BLUE,
                          child: Text(
                            'Turn On',
                            style: TextStyle(
                              color: WHITE,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
