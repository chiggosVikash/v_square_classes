import 'dart:io';

import 'package:vsquareclasses/src/features/admin/couse_management/data/data_sources/remote/course_management_firebase_data_source_impl.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/data/data_sources/remote/image_storage_firebase_data_source_impl.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/data/repos/course_management_repo_impl.dart';
import 'package:vsquareclasses/src/services/image_picker_service/image_picker_service.dart';
import 'package:vsquareclasses/src/services/image_picker_service/image_picker_service_impl.dart';

import '../../data/models/course_model.dart';
import '../repos/course_management_repo.dart';

class CourseManagementUsecase {
  final CourseManagementRepo _courseManagementRepo = CourseManagementRepoImpl(
    CourseManagementFirebaseDataSourceImpl(),
    ImageStroageFirebaseDataSourceImpl(),
  );
  final ImagePickerService _imagePickerService = ImagePickerServiceImpl();

  Future<File> pickMobileGalleryImage({required int imageQuality}) async {
    return _imagePickerService.galleryImageMobile(imageQuality: imageQuality);
  }

  Future<File> pickMobileCameraImage({required int imageQuality}) async {
    return _imagePickerService.cameraImageMobile(imageQuality: imageQuality);
  }

  Future<String> uploadFileImage({required File file, required String path}) {
    return _courseManagementRepo.uploadFileImage(file: file, path: path);
  }

  Future<bool> deleteImage(String imageUrl) {
    return _courseManagementRepo.deleteImage(imageUrl);
  }

  Future<String> uploadImageBytes({required File file, required String path}) {
    return _courseManagementRepo.uploadImageBytes(file: file, path: path);
  }

  Future<bool> saveCourse(CourseModel course) {
    return _courseManagementRepo.addCourse(course);
  }
}
