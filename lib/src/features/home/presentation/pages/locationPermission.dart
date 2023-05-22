import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GPSPermission extends StatefulWidget {
  const GPSPermission({Key? key}) : super(key: key);

  @override
  State<GPSPermission> createState() => _GPSPermissionState();
}

class _GPSPermissionState extends State<GPSPermission> {
  String result = "";
  LocationPermission _locationPermission = LocationPermission.denied;

  @override
  void initState() {
    super.initState();
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        result = 'Location permission granted';
      });
    } else if (status.isDenied) {
      setState(() {
        result = 'Location permission denied';
      });
    } else if (status.isPermanentlyDenied) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
            'Please grant Location permission to use this app.',
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
      appBar: AppBar(title: const Text('Location Testing')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // Check location permission status
              _locationPermission = await Geolocator.checkPermission();
              if (_locationPermission == LocationPermission.denied) {
                _locationPermission = await Geolocator.requestPermission();
                if (_locationPermission == LocationPermission.denied) {
                  // Location permission not granted
                  return;
                }
              }
              // Add your logic here to handle button click
            },
            child: const Text('location permission'),
          ),
          Center(
            child: Text(result),
          )
        ],
      ),
    );
  }
}
