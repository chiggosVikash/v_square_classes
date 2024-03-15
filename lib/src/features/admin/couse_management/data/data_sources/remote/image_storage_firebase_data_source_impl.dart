import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/data/data_sources/remote/image_storage_data_source.dart';

class ImageStroageFirebaseDataSourceImpl implements ImageStorageDataSource {
  final _storage = FirebaseStorage.instance.ref();

  /// Deletes an image from the Firebase storage.
  ///
  /// Returns `true` if the image is successfully deleted, otherwise `false`.
  ///
  /// Parameters:
  /// - `imageUrl`: The URL of the image to be deleted.
  ///
  /// Throws:
  /// - `FirebaseException`: If there is an error while deleting the image.
  @override
  Future<bool> deleteImage(String imageUrl) async {
    final ref = _storage.child(imageUrl);
    await ref.delete();
    return true;
  }

  /// Updates the image bytes in the Firebase storage.
  ///
  /// This method takes a [file] and a [path] as parameters and uploads the file
  /// bytes to the specified path in the Firebase storage. It returns a [Future]
  /// that completes with the download URL of the uploaded image.
  ///
  /// Example usage:
  /// ```dart
  /// final file = File('path/to/image.jpg');
  /// final path = 'images/profile.jpg';
  /// final downloadURL = await updateImageBytes(file: file, path: path);
  /// print('Download URL: $downloadURL');
  /// ```
  @override
  Future<String> updateImageBytes(
      {required File file, required String path}) async {
    final ref = _storage.child(path);
    final uploadTask = await ref.putData(await file.readAsBytes());
    return await uploadTask.ref.getDownloadURL();
  }

  /// Uploads a file image to the specified path in Firebase storage.
  ///
  /// The [file] parameter represents the file to be uploaded.
  /// The [path] parameter represents the path where the file will be stored.
  ///
  /// Returns a [Future] that completes with the download URL of the uploaded file.
  @override
  Future<String> uploadFileImage(
      {required File file, required String path}) async {
    final ref = _storage.child(path);
    final uploadTask = await ref.putFile(file);
    return await uploadTask.ref.getDownloadURL();
  }
}
