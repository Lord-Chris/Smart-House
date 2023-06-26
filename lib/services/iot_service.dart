import 'package:http/http.dart';

class IOTService {
  static const esp8266HostUrl = 'http://esp8266.io';
  final _client = Client();

  /// Return type: [Future]<[bool]>
  /// Param: `deviceId` of type [String]
  Future<bool> turnOnDevice(String deviceId) async {
    final res = await _client.post(Uri.parse("$esp8266HostUrl/turnOn"));
    if (res.statusCode == 200 || res.statusCode == 201) return true;
    return false;
  }

  /// Return type: [Future]<[bool]>
  /// Param: `deviceId` of type [String]
  Future<bool> turnOffDevice(String deviceId) async {
    final res = await _client.post(Uri.parse("$esp8266HostUrl/turnOff"));
    if (res.statusCode == 200 || res.statusCode == 201) return true;
    return false;
  }
}
