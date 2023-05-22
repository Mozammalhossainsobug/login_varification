import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MicStreamExampleApp extends StatefulWidget {
  const MicStreamExampleApp({Key? key}) : super(key: key);

  @override
  _MicStreamExampleAppState createState() => _MicStreamExampleAppState();
}

class _MicStreamExampleAppState extends State<MicStreamExampleApp> {
  late String result = "";

  @override
  void initState() {
    super.initState();
    requestMicrophonePermission();
  }

  Future<void> requestMicrophonePermission() async {
    PermissionStatus status = await Permission.microphone.request();
    if (status.isGranted) {
      setState(() {
        result = 'Microphone permission granted';
      });
    } else if (status.isDenied) {
      setState(() {
        result = 'Microphone permission denied';
      });
    } else if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
            'Please grant microphone permission to use this app.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
              child: const Text('Open Settings'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Microphone Testing')),
      body: Center(
        child: Text(result),
      ),
    );
  }
}
