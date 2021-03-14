import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  static const routeName = "/add-place";
  @override
  _ImageInput createState() => _ImageInput();
}

class _ImageInput extends State<ImageInput> {
  //nullable
  late File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(_storedImage,
                  fit: BoxFit.cover, width: double.infinity)
              : Text('No Image Taken'),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              _takePicture;
            },
            icon: Icon(Icons.camera),
            label: Text(
              'Take picture',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
