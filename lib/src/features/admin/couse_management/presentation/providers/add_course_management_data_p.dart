import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/data/models/course_model.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/presentation/providers/save_course_p.dart';

final addCourseManagementDataProvider =
    NotifierProvider<AddCourseManagementDataP, CourseModel>(
  () => AddCourseManagementDataP(),
);

/// The provider for the course management data.
///
class AddCourseManagementDataP extends Notifier<CourseModel> {
  @override
  CourseModel build() {
    return CourseModel.blankInitialise();
  }

  /// [Info][createNewCourseId] is used for creating new course id when new course is going to be added
  /// Generates a new course ID based on the current timestamp.
  /// Updates the state with the new ID and returns it.
  String createNewCourseId() {
    final generatedId = DateTime.now().millisecondsSinceEpoch.toString();
    state = state.copyWith(id: generatedId);
    print("generated id : $generatedId model id : ${state.id}");
    return state.id;
  }

  /// Updates the course model with the provided [courseModel]. when current course is going to be update
  ///
  /// This method sets the state of the course model to the provided [courseModel].
  ///
  /// Example usage:
  /// ```dart
  /// CourseModel newCourseModel = CourseModel();
  /// updateCourseModel(newCourseModel);
  /// ```
  void updateCourseModel(CourseModel courseModel) {
    state = courseModel;
  }

  /// Updates the course ID in the course management data. when new course is going to be added
  ///
  /// This method takes a [String] parameter [id] and updates the course ID in the current state of the course management data provider.
  /// It uses the `copyWith` method to create a new state object with the updated course ID.
  ///
  /// Example usage:
  /// ```dart
  /// updateCourseId('12345');
  /// ```
  void updateCourseId(String id) {
    state = state.copyWith(id: id);
  }

  /// Adds an image to the course management data.
  ///
  ///[Info][image] is used for UI representation of image and [image] is used for storing image in storage
  /// and it is not going to save in database
  ///
  /// The [image] parameter is the file representing the image to be added.
  /// This method updates the state by copying the current state and setting the [image] property to the provided [image].
  void addImage(File image) {
    state = state.copyWith(image: image);
  }

  /// Updates the language of the course management data.
  ///
  /// The [language] parameter specifies the new language to be set.
  /// This method updates the state of the course management data provider
  /// by creating a new copy of the state with the updated language.
  void updateLanguage(String language) {
    state = state.copyWith(language: language);
  }

  /// Updates the class name in the course management data.
  ///
  /// This method takes a [className] parameter and updates the class name in the current state
  /// of the course management data provider. It uses the `copyWith` method to create a new state
  /// object with the updated class name.
  ///
  /// Example usage:
  /// ```dart
  /// updateClassName('Math');
  /// ```
  void updateClassName(String className) {
    state = state.copyWith(class_: className);
  }

  /// Updates the batch value in the course management data state.
  ///
  /// The [batch] parameter represents the new batch value to be updated.
  /// This method updates the state by creating a copy of the current state
  /// and replacing the batch value with the new value.
  void updateBatch(String batch) {
    state = state.copyWith(batch: batch);
  }

  /// Updates the duration type of the course management data.
  ///
  /// The [durationType] parameter specifies the new duration type to be set.
  /// This method updates the state of the course management data by creating a copy
  /// of the current state and replacing the duration type with the specified value.
  void updateDurationType(String durationType) {
    state = state.copyWith(durationType: durationType);
  }

  /// Assigns the given values to the corresponding fields of the course management data state.
  ///
  /// The [courseName] parameter is the name of the course .
  /// The [description] parameter is the description of the course.
  /// The [price] parameter is the price of the course.
  /// The [offerPrice] parameter is the offer price of the course.
  /// The [duration] parameter is the duration of the course.
  /// The [totalEnrolled] parameter is the total number of enrolled students in the course.
  void assignCourseFields(
      {required String courseName,
      required String description,
      required String price,
      required String offerPrice,
      required String duration,
      required String totalEnrolled}) {
    state = state.copyWith(
      name: courseName,
      description: description,
      price: double.parse(price.isEmpty ? '0' : price),
      offerPrice: double.parse(offerPrice.isEmpty ? '0' : offerPrice),
      duration: int.parse(duration.isEmpty ? '0' : duration),
      totalEnrolled: int.parse(totalEnrolled.isEmpty ? '0' : totalEnrolled),
    );
  }

  void saveCourse() {
    ref.read(saveCourseProvider.notifier).saveCourse(course: state);
  }
}
