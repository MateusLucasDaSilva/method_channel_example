import 'package:flutter/material.dart';
import 'package:method_channel_example/battery_channel.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int batteryLevelLabel = 0;
  final BatteryChannel _channel = BatteryChannel();

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  void _getBatteryLevel() {
    _channel.getBatteryLevel().then((value) {
      setState(() {
        if (value != null) {
          batteryLevelLabel = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Text('Battery Level $batteryLevelLabel'),
            ),
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text(
                'Update Battery',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
