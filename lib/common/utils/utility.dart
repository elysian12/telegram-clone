import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content)),
  );
}

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      image = File(pickImage.path);
    }
  } catch (e) {
    showSnackbar(context, e.toString());
  }

  return image;
}
