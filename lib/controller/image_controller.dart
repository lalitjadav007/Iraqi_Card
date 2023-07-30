import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  static ImageController get to => Get.find<ImageController>();

  Rx<File?> image = null.obs;
  String? imagePath;
  final _picker = ImagePicker();

  void getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      imagePath = pickedFile.path;
      debugPrint(imagePath);
    } else {
      debugPrint('No image selected.');
    }
  }
}
