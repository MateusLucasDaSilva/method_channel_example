import 'package:flutter/services.dart';

class BatteryChannel {
  final MethodChannel _channel = const MethodChannel('my_app/method/battery');

  Future<int?> getBatteryLevel() async {
    return _channel.invokeMethod<int>('getNativeBatteryLevel');
  }
}
