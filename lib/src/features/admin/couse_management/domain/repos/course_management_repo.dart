import 'dart:io';

import 'package:vsquareclasses/src/features/admin/couse_management/domain/entities/courseEntity.dart';

import '../../data/models/course_model.dart';

abstract interface class CourseManagementRepo {
  Future<List<CourseEntity>> getAllCourses();
  Future<CourseEntity> getCourseById(String courseId);
  Future<bool> addCourse(CourseModel course);
  Future<bool> updateCourse(CourseModel course);
  Future<String> deleteCourse(String courseId);
  Future<List<CourseEntity>> getCourseByCategory(String category);
  Future<List<CourseEntity>> getCourseByLevel(String level);
  Future<List<CourseEntity>> getCourseByLanguage(String language);

  Future<List<CourseEntity>> getCourseLazily(
      {int limit = 10, required String lastCourseId});

  Future<String> uploadFileImage({required File file, required String path});
  Future<bool> deleteImage(String imageUrl);
  Future<String> uploadImageBytes({required File file, required String path});
}
