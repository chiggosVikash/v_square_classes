import '../../models/course_model.dart';

/// A data source interface for managing courses.
abstract interface class CourseManagementDataSource {
  /// Retrieves all courses.
  Future<List<CourseModel>> getAllCourses();

  /// Retrieves a course by its ID.
  ///
  /// [courseId] - The ID of the course to retrieve.
  Future<CourseModel> getCourseById(String courseId);

  /// Adds a new course.
  ///
  /// [course] - The course to add.
  Future<bool> addCourse(CourseModel course);

  /// Updates an existing course.
  ///
  /// [course] - The course to update.
  Future<bool> updateCourse(CourseModel course);

  /// Deletes a course by its ID.
  ///
  /// [courseId] - The ID of the course to delete.
  Future<String> deleteCourse(String courseId);

  /// Retrieves courses by category.
  ///
  /// [category] - The category of the courses to retrieve.
  Future<List<CourseModel>> getCourseByCategory(String category);

  /// Retrieves courses by level.
  ///
  /// [level] - The level of the courses to retrieve.
  Future<List<CourseModel>> getCourseByLevel(String level);

  /// Retrieves courses by language.
  ///
  /// [language] - The language of the courses to retrieve.
  Future<List<CourseModel>> getCourseByLanguage(String language);

  /// Retrieves courses lazily.
  ///
  /// [limit] - The maximum number of courses to retrieve. Default is 10.
  /// [lastCourseId] - The ID of the last retrieved course.
  Future<List<CourseModel>> getCourseLazily(
      {int limit = 10, required String lastCourseId});
}
