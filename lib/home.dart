import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_house/rooms.dart';

import 'constants.dart';

class Home extends StatelessWidget {
  final String name = 'John';
  final List<IconData> icons = [
    Icons.king_bed,
    Icons.local_laundry_service,
    Icons.restaurant,
    Icons.store,
    Icons.family_restroom
  ];
  final List<String> labels = [
    'BedRoom',
    'Laundry Room',
    'kitchen',
    'Store',
    'Reading room'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.roofing,
                            color: BLUE,
                            size: 30,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Smart Home',
                            style: TextStyle(
                              color: BLUE,
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    CircleAvatar(
                      backgroundColor: BLUE,
                      child: Icon(
                        Icons.person,
                        color: WHITE,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Welcome home,',
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 20),
                child: Text(
                  name,
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Divider(color: BLUE),
              Expanded(
                flex: 5,
                child: Center(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: BLUE.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(Icons.power, size: 50, color: ORANGE),
                            SizedBox(height: 5),
                            Text(
                              '${Random().nextInt(50)} kW/hr',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: WHITE,
                              ),
                            ),
                            Text(
                              'Total Power Consumption\nRate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: WHITE,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(color: BLUE),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: icons.length,
                    itemBuilder: (__, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Rooms(room: labels[index])));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: BLUE.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 20,
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Icon(icons[index], size: 25, color: ORANGE),
                                Text(
                                  '${Random().nextInt(50)} kW/hr',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: WHITE,
                                  ),
                                ),
                                Text(
                                  labels[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    color: WHITE,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
