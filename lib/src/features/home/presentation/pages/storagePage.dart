import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermission extends StatefulWidget {
  const StoragePermission({super.key});

  @override
  State<StoragePermission> createState() => _StoragePermissionState();
}

class _StoragePermissionState extends State<StoragePermission> {

  late String result = "";

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      setState(() {
        result = 'Storage permission granted';
      });
    } else if (status.isDenied) {
      setState(() {
        result = 'Storage permission denied';
      });
    } else if (status.isPermanentlyDenied) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
            'Please grant Storage permission to use this app.',
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

   Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        // Display the picked file path or other details
        String filePath = result.files.single.path!;
        // Do something with the file path
        print('Picked file path: $filePath');
      });
    } else {
      // User canceled the file picking
      print('User canceled');
    }
  }



  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Storage Permission Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result),
            ElevatedButton(
              onPressed: pickFile,
              child: Text('Pick File'),
            ),
          ],
        ),
      ),
    );
  }
}