import 'dart:io';

import 'package:vsquareclasses/src/features/admin/couse_management/data/data_sources/remote/image_storage_data_source.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/data/models/course_model.dart';

import 'package:vsquareclasses/src/features/admin/couse_management/domain/entities/courseEntity.dart';

import '../../domain/repos/course_management_repo.dart';
import '../data_sources/remote/course_management_data_source.dart';

class CourseManagementRepoImpl implements CourseManagementRepo {
  final CourseManagementDataSource _dataSource;
  final ImageStorageDataSource _imageStorageDataSource;
  CourseManagementRepoImpl(this._dataSource, this._imageStorageDataSource);
  @override
  Future<bool> addCourse(CourseModel course) {
    return _dataSource.addCourse(course);
  }

  @override
  Future<String> deleteCourse(String courseId) {
    return _dataSource.deleteCourse(courseId);
  }

  @override
  Future<List<CourseEntity>> getAllCourses() {
    return _dataSource.getAllCourses();
  }

  @override
  Future<List<CourseEntity>> getCourseByCategory(String category) {
    return _dataSource.getCourseByCategory(category);
  }

  @override
  Future<CourseEntity> getCourseById(String courseId) {
    return _dataSource.getCourseById(courseId);
  }

  @override
  Future<List<CourseEntity>> getCourseByLanguage(String language) {
    return _dataSource.getCourseByLanguage(language);
  }

  @override
  Future<List<CourseEntity>> getCourseByLevel(String level) {
    return _dataSource.getCourseByLevel(level);
  }

  @override
  Future<List<CourseEntity>> getCourseLazily(
      {int limit = 10, required String lastCourseId}) {
    return _dataSource.getCourseLazily(
        limit: limit, lastCourseId: lastCourseId);
  }

  @override
  Future<bool> updateCourse(CourseModel course) {
    return _dataSource.updateCourse(course);
  }

  @override
  Future<bool> deleteImage(String imageUrl) {
    return _imageStorageDataSource.deleteImage(imageUrl);
  }

  @override
  Future<String> uploadImageBytes({required File file, required String path}) {
    return _imageStorageDataSource.updateImageBytes(file: file, path: path);
  }

  @override
  Future<String> uploadFileImage({required File file, required String path}) {
    return _imageStorageDataSource.uploadFileImage(file: file, path: path);
  }
}
