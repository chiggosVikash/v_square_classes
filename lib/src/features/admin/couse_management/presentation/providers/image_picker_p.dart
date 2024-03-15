import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/exceptions/course_management_exception.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/domain/usecases/couse_management_usecase.dart';

final imagePickerProvider = AsyncNotifierProvider<ImagePickerP, File?>(
  () => ImagePickerP(),
);

class ImagePickerP extends AsyncNotifier<File?> {
  final _courseMangementUsecase = CourseManagementUsecase();
  @override
  FutureOr<File?> build() {
    return null;
  }

  /// Picks an image from the mobile gallery with the specified image quality.
  ///
  /// The [imageQuality] parameter determines the quality of the picked image.
  /// Higher values result in better quality but larger file sizes.
  ///
  /// Throws an [ImagePickerException] if an error occurs during the image picking process.
  Future<File?> pickMobileGalleryImage({required int imageQuality}) async {
    state = const AsyncLoading();
    try {
      final image = await _courseMangementUsecase.pickMobileGalleryImage(
          imageQuality: imageQuality);
      state = AsyncData(image);
      return image;
    } catch (e) {
      state = AsyncError(
          ImagePickerException(message: e.toString()), StackTrace.current);
      if (kDebugMode) {
        rethrow;
      }
    }
    throw ImagePickerException(message: 'Error occurred while picking image');
  }

  /// Picks an image from the mobile camera with the specified image quality.
  ///
  /// The [imageQuality] parameter determines the quality of the captured image.
  /// Higher values result in better quality but larger file sizes.
  ///
  /// Throws an [ImagePickerException] if an error occurs during the image picking process.
  Future<void> pickMobileCameraImage({required int imageQuality}) async {
    state = const AsyncLoading();
    try {
      final image = await _courseMangementUsecase.pickMobileCameraImage(
          imageQuality: imageQuality);
      state = AsyncData(image);
    } catch (e, st) {
      state = AsyncError(ImagePickerException(message: e.toString()), st);
      if (kDebugMode) {
        rethrow;
      }
    }
  }
}
