import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vsquareclasses/src/exceptions/course_management_exception.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/data/data_sources/remote/course_management_data_source.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/data/models/course_model.dart';

class CourseManagementFirebaseDataSourceImpl
    implements CourseManagementDataSource {
  final _firestore = FirebaseFirestore.instance;

  /// Adds a course to the Firestore database.
  ///
  /// Returns `true` if the course is successfully added, otherwise throws an exception.
  /// The [course] parameter is the course model to be added.
  /// Throws a [FirebaseException] if there is an error with the Firebase operation.
  /// Throws an [Exception] if there is any other error.
  ///
  @override
  Future<bool> addCourse(CourseModel course) async {
    try {
      final courseCollection = _firestore.collection('courses');
      final result = await courseCollection.add(course.toJson());
      if (result.id.isNotEmpty) {
        return true;
      }
      throw Exception('Failed to add course');
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Deletes a course with the given [courseId] from the Firebase Firestore.
  /// Returns a [Future] that completes with a [String] message indicating the success of the deletion.
  /// Throws a [FirebaseException] if there is an error with Firebase operations.
  /// Throws an [Exception] if there is any other error.
  @override
  Future<String> deleteCourse(String courseId) async {
    try {
      final courseCollection = _firestore.collection('courses');
      await courseCollection.doc(courseId).delete();
      return 'Course deleted successfully';
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw CourseDeletionException(message: e.toString());
    }
  }

  /// Retrieves all courses from the Firestore database.
  ///
  /// Returns a list of [CourseModel] objects representing the courses.
  /// Throws a [FirebaseException] if there is an error accessing the Firestore database.
  /// Throws a [CourseRetrievalException] if there is an error retrieving the courses.
  @override
  Future<List<CourseModel>> getAllCourses() async {
    try {
      final courseCollection = _firestore.collection('courses');
      final courseSnapshot = await courseCollection.get();
      final courses = courseSnapshot.docs
          .map((doc) => CourseModel.fromJson(doc.data()))
          .toList();
      return courses;
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw CourseRetrievalException(message: e.toString());
    }
  }

  /// Retrieves a list of [CourseModel] objects from the Firestore database based on the given [category].
  /// Returns a Future that resolves to the list of courses.
  /// Throws a [FirebaseException] if there is an error accessing the Firestore database.
  /// Throws a [CourseCategoryRetrievalException] if there is an error retrieving the courses by category.
  @override
  Future<List<CourseModel>> getCourseByCategory(String category) async {
    try {
      final courseCollection = _firestore.collection('courses');
      final courseSnapshot =
          await courseCollection.where('category', isEqualTo: category).get();
      final courses = courseSnapshot.docs
          .map((doc) => CourseModel.fromJson(doc.data()))
          .toList();
      return courses;
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw CourseCategoryRetrievalException(message: e.toString());
    }
  }

  /// Retrieves a course from the Firebase Firestore database by its ID.
  ///
  /// Throws a [FirebaseException] if there is an error accessing the Firestore database.
  /// Throws a [CourseRetrievalException] if there is an error retrieving the course.
  ///
  /// Returns a [CourseModel] object representing the retrieved course.
  @override
  Future<CourseModel> getCourseById(String courseId) async {
    try {
      final courseCollection = _firestore.collection('courses');
      final courseSnapshot = await courseCollection.doc(courseId).get();
      final course = CourseModel.fromJson(courseSnapshot.data()!);
      return course;
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw CourseRetrievalException(message: e.toString());
    }
  }

  /// Retrieves a list of [CourseModel] objects from the Firestore database based on the specified [language].
  ///
  /// Throws a [FirebaseException] if there is an error accessing the Firestore database.
  /// Throws a [CourseLanguageRetrievalException] if there is an error retrieving the courses by language.
  ///
  /// Returns a [Future] that completes with a list of [CourseModel] objects.
  @override
  Future<List<CourseModel>> getCourseByLanguage(String language) async {
    try {
      final courseCollection = _firestore.collection('courses');
      final courseSnapshot =
          await courseCollection.where('language', isEqualTo: language).get();
      final courses = courseSnapshot.docs
          .map((doc) => CourseModel.fromJson(doc.data()))
          .toList();
      return courses;
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw CourseLanguageRetrievalException(message: e.toString());
    }
  }

  /// Retrieves a list of [CourseModel] objects from the Firestore database based on the specified [level].
  ///
  /// Throws a [FirebaseException] if there is an error accessing the Firestore database.
  /// Throws a [CourseLevelRetrievalException] if there is an error retrieving the course data.
  ///
  /// Returns a [Future] that resolves to a list of [CourseModel] objects.
  @override
  Future<List<CourseModel>> getCourseByLevel(String level) async {
    try {
      final courseCollection = _firestore.collection('courses');
      final courseSnapshot =
          await courseCollection.where('level', isEqualTo: level).get();
      final courses = courseSnapshot.docs
          .map((doc) => CourseModel.fromJson(doc.data()))
          .toList();
      return courses;
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw CourseLevelRetrievalException(message: e.toString());
    }
  }

  /// Updates a course in the Firebase Firestore database.
  ///
  /// Returns `true` if the course is successfully updated, otherwise throws an exception.
  /// The [course] parameter is the course model to be updated.
  /// Throws a [FirebaseException] if there is an error with the Firebase Firestore.
  /// Throws a [CourseUpdateException] if there is an error updating the course.
  @override
  Future<bool> updateCourse(CourseModel course) async {
    try {
      final courseCollection = _firestore.collection('courses');
      await courseCollection.doc(course.id).update(course.toJson());
      return true;
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw CourseUpdateException(message: e.toString());
    }
  }

  /// Retrieves a lazily loaded list of courses from the Firebase data source.
  ///
  /// The [limit] parameter specifies the maximum number of courses to retrieve.
  /// The [lastCourseId] parameter is used as a starting point to fetch the next set of courses.
  ///
  /// Returns a [Future] that resolves to a list of [CourseModel] objects.
  /// Throws a [FirebaseException] if there is an error accessing the Firebase database.
  /// Throws an [Exception] if there is any other error.
  @override
  Future<List<CourseModel>> getCourseLazily(
      {int limit = 10, required String lastCourseId}) async {
    try {
      final courseCollection = _firestore.collection('courses');
      final courseSnapshot = await courseCollection
          .orderBy("id")
          .startAfter([lastCourseId])
          .limit(limit)
          .get();
      final courses = courseSnapshot.docs
          .map((doc) => CourseModel.fromJson(doc.data()))
          .toList();
      return courses;
    } on FirebaseException {
      throw FirebaseException;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
