import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_house/models/device_model.dart';
import 'package:smart_house/services/iot_service.dart';

import '../shared/constants.dart';

class RoomsView extends StatelessWidget {
  final String room;

  final List<DeviceModel> appliances = [
    DeviceModel(
      name: 'TV',
      powerSaved: '${Random().nextInt(20)} kW',
    ),
    DeviceModel(
      name: 'AC (Temp: ${(Random().nextDouble() * 10).toStringAsFixed(1)}`C)',
      powerSaved: '${Random().nextInt(20)} kW',
    ),
    DeviceModel(
      name: 'Fan (Level: ${Random().nextInt(5)})',
      powerSaved: '${Random().nextInt(20)} kW',
    ),
    DeviceModel(
      name: 'Socket 1',
      powerSaved: '${Random().nextInt(20)} kW',
    ),
    DeviceModel(
      name: 'Socket 2',
      powerSaved: '${Random().nextInt(20)} kW',
    ),
  ];

  RoomsView({Key key, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: Text(
          room,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (__, index) {
          final device = appliances[index];
          return HookBuilder(builder: (context) {
            final isOn = useState(true);
            return Card(
              margin: const EdgeInsets.all(8),
              color: AppColors.blue.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.blue.withOpacity(0.7),
                      child: const Icon(
                        Icons.lightbulb,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appliances[index].name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              color: AppColors.white,
                            ),
                          ),
                          const Divider(color: AppColors.beige, thickness: 2),
                          Text(
                            'Off since: ${device.offHrs} hrs',
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'Power Saved: ${device.powerSaved}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            IOTService().turnOnDevice(device.id);
                            isOn.value = !isOn.value;
                          },
                          color: AppColors.blue,
                          child: Text(
                            isOn.value ? 'Turn On' : 'Turn Off',
                            style: const TextStyle(
                              color: AppColors.white,
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
          });
        },
      ),
    );
  }
}
