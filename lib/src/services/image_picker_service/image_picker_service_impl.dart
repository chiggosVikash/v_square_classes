import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'image_picker_service.dart';

class ImagePickerServiceImpl implements ImagePickerService {
  final _imagePicker = ImagePicker();
  @override
  Future<File> cameraImageMobile({required int imageQuality}) async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: imageQuality,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    throw Exception('No image selected');
  }

  @override
  Future<File> galleryImageMobile({required int imageQuality}) async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    throw Exception('No image selected');
  }
}
