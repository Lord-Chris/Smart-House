import 'dart:math';

import 'package:flutter/material.dart';

import '../shared/constants.dart';
import 'rooms_view.dart';

class HomeView extends StatelessWidget {
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

  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.roofing,
                          color: AppColors.blue,
                          size: 30,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Smart Home',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Spacer(),
                    const CircleAvatar(
                      backgroundColor: AppColors.blue,
                      child: Icon(
                        Icons.person,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Welcome home,',
                  style: TextStyle(
                    color: AppColors.blue,
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
                  style: const TextStyle(
                    color: AppColors.blue,
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const Divider(color: AppColors.blue),
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
                        color: AppColors.blue.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(Icons.power, size: 50, color: ORANGE),
                            const SizedBox(height: 5),
                            Text(
                              '${Random().nextInt(50)} kW/hr',
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: AppColors.white,
                              ),
                            ),
                            const Text(
                              'Total Power Consumption\nRate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(color: AppColors.blue),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: icons.length,
                  itemBuilder: (__, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RoomsView(room: labels[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.blue.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 20,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Icon(icons[index], size: 25, color: ORANGE),
                              Text(
                                '${Random().nextInt(50)} kW/hr',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                labels[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
