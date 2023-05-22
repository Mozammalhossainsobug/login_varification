import 'package:flutter/material.dart';
import 'package:login_varification/src/features/home/presentation/pages/locationPermission.dart';
import 'package:login_varification/src/features/home/presentation/pages/imagePermission.dart';
import 'package:login_varification/src/features/home/presentation/pages/storagePage.dart';

import '../presentation/pages/microphonePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PermissionStatus _microphonePermissionStatus = PermissionStatus.denied;

  // @override
  // void initState() {
  //   super.initState();
  //   requestMicrophonePermission();
  // }

  // Future<void> requestMicrophonePermission() async {
  //   final status = await Permission.microphone.request();
  //   setState(() {
  //     _microphonePermissionStatus = status;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MicStreamExampleApp()),);
            }, child: const Text('Microphone Permission')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePermission()),);
            }, child: const Text('Image Permission')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GPSPermission()),);
            },child: const Text('Location Permission'),),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => StoragePermission()),);
            },child: const Text('Storage Permission'),),
          ],
        ),
      ),
    );
  }
}
