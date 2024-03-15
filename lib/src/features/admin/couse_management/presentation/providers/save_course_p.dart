import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/exceptions/course_management_exception.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/data/models/course_model.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/domain/usecases/couse_management_usecase.dart';

final saveCourseProvider =
    AsyncNotifierProvider<SaveCourseP, bool>(() => SaveCourseP());

class SaveCourseP extends AsyncNotifier<bool> {
  final _courseManagementUsecase = CourseManagementUsecase();
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<String> _saveFileImage(
      {required File file, required String path}) async {
    return _courseManagementUsecase.uploadFileImage(file: file, path: path);
  }

  Future<void> saveCourse({required CourseModel course}) async {
    try {
      state = const AsyncLoading();
      if (course.image != null) {
        final imageUrl = await _saveFileImage(
            file: course.image!, path: "courses/${course.id}.png");
        course = course.copyWith(imageUrl: imageUrl);
      }
      state = AsyncData(await _courseManagementUsecase.saveCourse(course));
    } on FirebaseException catch (e, st) {
      state = AsyncError(
          CourseCreationException(message: e.message ?? e.toString()), st);
    } catch (e, st) {
      state = AsyncError(CourseCreationException(message: e.toString()), st);
      if (kDebugMode) {
        rethrow;
      }
    }
  }
}
