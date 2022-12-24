import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage; //that we recived from the add_place function.
  ImageInput(this.onSelectImage);
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths
        .getApplicationDocumentsDirectory(); //await beacuse this give's us a future , thi's gives us the application directory.

    final fileName = path.basename(imageFile
        .path); //to get the name of the image and the path where the image stored.

    final savedImage = await _storedImage.copy(
        '${appDir.path}/$fileName'); //here i copy the file into the app path and i keep the image name.
    widget.onSelectImage(savedImage); //excute the function that we point on
  } //we used await here beacuse we deailed with async

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: _storedImage != null
                ? Image.file(
                    _storedImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Text("No Image Taken", textAlign: TextAlign.center),
            alignment: Alignment.center),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text("Take Picture"),
          ),
        ),
      ],
    );
  }
}
