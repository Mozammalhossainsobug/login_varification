import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePermission extends StatefulWidget {
const ImagePermission({Key? key}) : super(key: key);

@override
State<ImagePermission> createState() => _ImagePermissionState();
}

class _ImagePermissionState extends State<ImagePermission> {
File? _imageFile;

Future<void> _getImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: source);

  if (pickedFile != null) {
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('ImagePermission')),
    body: Column(
      children: [
        Row(children: [
          ElevatedButton(
          onPressed: () {
            _getImage(ImageSource.camera);
          },
          child: const Text('Take Photo'),
        ),
        ElevatedButton(
          onPressed: () {
            _getImage(ImageSource.gallery);
          },
          child: const Text('Choose from Gallery'),
        ),
        ],),
        
        if (_imageFile != null)
          CircleAvatar(
            radius: 80,
            backgroundImage: FileImage(_imageFile!),
          ),
      ],
    ),
  );
}
}