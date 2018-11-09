import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGalleryUI extends StatefulWidget {
  @override
  _ImageGalleryUIState createState() => _ImageGalleryUIState();
}

class _ImageGalleryUIState extends State<ImageGalleryUI> {
  File _image;

  Future selectImage(bool galleryPic) async {
    File image;
    if (galleryPic) {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        bottomNavigationBar: BottomAppBar(child: _uiControlRowWidget()),
        body: Center(
          child:
              _image == null ? Text('No image selected.') : Image.file(_image),
        ));
  }

  Widget _uiControlRowWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: const Icon(Icons.save),
            color: Colors.blue,
            onPressed: () {
              print('save image and go back ');

              Navigator.pop(context);
            }),
        IconButton(
            icon: const Icon(Icons.add_a_photo),
            color: Colors.blue,
            onPressed: () {
              selectImage(true);
            }),
        IconButton(
            icon: const Icon(Icons.camera),
            color: Colors.blue,
            onPressed: () {
              selectImage(false);
            }),
      ],
    );
  }
}
