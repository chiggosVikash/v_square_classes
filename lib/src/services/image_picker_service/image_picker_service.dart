import 'dart:io';


/// An abstract class representing a service for picking images.
abstract class ImagePickerService {
  
  /// Retrieves an image from the camera on a mobile device.
  ///
  /// The [imageQuality] parameter specifies the quality of the captured image.
  /// Returns a [File] object representing the selected image.
  Future<File> cameraImageMobile({required int imageQuality});
  
  /// Retrieves an image from the gallery on a mobile device.
  ///
  /// The [imageQuality] parameter specifies the quality of the selected image.
  /// Returns a [File] object representing the selected image.
  Future<File> galleryImageMobile({required int imageQuality});
}