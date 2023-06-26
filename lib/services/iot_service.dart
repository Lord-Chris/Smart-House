import 'package:http/http.dart';

class IOTService {
  static const esp8266HostUrl = 'http://esp8266.io';
  final _client = Client();

  Future<bool> turnOnDevice(String deviceId) async {
    final res = await _client.post(Uri.parse("$esp8266HostUrl/turnOn"));
    if (res.statusCode == 200 || res.statusCode == 201) return true;
    return false;
  }

  Future<bool> turnOffDevice(String deviceId) async {
    final res = await _client.post(Uri.parse("$esp8266HostUrl/turnOff"));
    if (res.statusCode == 200 || res.statusCode == 201) return true;
    return false;
  }
}
