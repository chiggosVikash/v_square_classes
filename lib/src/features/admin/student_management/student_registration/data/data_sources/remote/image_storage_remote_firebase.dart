import 'dart:io';

import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import 'image_storage_remote.dart';

class ImageStorageRemoteFirebase implements ImageStorageRemote {
  final _firebaseStorage = FirebaseStorage.instance.ref();

  ImageStorageRemoteFirebase();

  @override
  Future<bool> deleteImage(String imageUrl) async{
    await FirebaseStorage.instance.ref(imageUrl).delete();
    return true;
  }

  @override
  Future<String> downloadImage(String imageUrl) {
     return FirebaseStorage.instance.ref(imageUrl).getDownloadURL();
  }

  @override
  Future<String> uploadFileImage(
      {required File imageFile, required String path}) async{
    final snapshot = await _firebaseStorage.child(path).putFile(imageFile);
    return await snapshot.ref.getDownloadURL();
  }

  @override
  Future<String> uploadImageBytes(
      {required Uint8List imageBytes, required String path}) async{
    final snapshot = await _firebaseStorage.child(path).putData(imageBytes);
    return await snapshot.ref.getDownloadURL();
  }
}
