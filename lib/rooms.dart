import 'package:flutter/material.dart';

import 'constants.dart';

class Rooms extends StatelessWidget {
  final String room;

  List<String> applian = ['TV', 'AC', 'Fan', 'Socket 1', 'Socket 2'];

  Rooms({Key key, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BEIGE,
      appBar: AppBar(
        // toolbarHeight: 70,
        backgroundColor: GREEN,
        title: Text(
          room,
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
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (__, index) {
            return Card(
              margin: EdgeInsets.all(8),
              color: GREEN,
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
                      backgroundColor: BEIGE,
                      child: Icon(
                        Icons.lightbulb,
                        color: ORANGE,
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
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              color: BLUE,
                            ),
                          ),
                          Divider(color: BEIGE, thickness: 2),
                          Text(
                            'Off since: 5 hrs',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: BLUE,
                            ),
                          ),
                          Text(
                            'Power Saved: 15 kW',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: BLUE,
                            ),
                          ),
                          Text(
                            'AC temperature: 27`C',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: BLUE,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {},
                          color: ORANGE,
                          child: Text(
                            'Turn On',
                            style: TextStyle(
                              color: BEIGE,
                              fontSize: 20,
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
