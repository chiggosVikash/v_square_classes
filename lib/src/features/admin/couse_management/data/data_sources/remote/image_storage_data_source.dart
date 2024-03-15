import 'dart:io';

abstract interface class ImageStorageDataSource {
  Future<String> uploadFileImage({required File file, required String path});
  Future<bool> deleteImage(String imageUrl);
  Future<String> updateImageBytes({required File file, required String path});
}
