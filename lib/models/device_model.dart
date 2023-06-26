import 'package:uuid/uuid.dart';

class DeviceModel {
  final String id;
  final String name;
  final int offHrs;
  final String powerSaved;

  DeviceModel({
    this.name,
    this.offHrs = 0,
    this.powerSaved,
  }) : id = const Uuid().v4();
}
