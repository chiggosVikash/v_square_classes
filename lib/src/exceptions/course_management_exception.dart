abstract interface class CourseManagementException implements Exception {
  // final String message;
  CourseManagementException({required String message, StackTrace? stackTrace});
}

class CourseCreationException implements CourseManagementException {
  final String message;
  CourseCreationException({required this.message, StackTrace? stackTrace});
}

class CourseDeletionException implements CourseManagementException {
  CourseDeletionException({required String message, StackTrace? stackTrace});
}

class CourseUpdateException implements CourseManagementException {
  CourseUpdateException({required String message, StackTrace? stackTrace});
}

class CourseRetrievalException implements CourseManagementException {
  CourseRetrievalException({required String message, StackTrace? stackTrace});
}

class CourseCategoryRetrievalException implements CourseManagementException {
  CourseCategoryRetrievalException(
      {required String message, StackTrace? stackTrace});
}

class CourseLevelRetrievalException implements CourseManagementException {
  CourseLevelRetrievalException(
      {required String message, StackTrace? stackTrace});
}

class CourseLanguageRetrievalException implements CourseManagementException {
  CourseLanguageRetrievalException(
      {required String message, StackTrace? stackTrace});
}

class ImagePickerException implements CourseManagementException {
  final String message;
  ImagePickerException({required this.message, StackTrace? stackTrace});
}
