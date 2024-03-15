import 'dart:io';
import 'dart:typed_data';

abstract interface class ImageStorageRemote {
  Future<String> uploadFileImage(
      {required File imageFile, required String path});
  Future<String> uploadImageBytes({required Uint8List imageBytes , required String path});
  Future<String> downloadImage(String imageUrl);
  Future<bool> deleteImage(String imageUrl);
}
