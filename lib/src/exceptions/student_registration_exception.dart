abstract interface class StudentRegistrationException implements Exception {
  // final String message;
  StudentRegistrationException({required String message,});
}

class StudentRegistrationCreationException implements StudentRegistrationException {
  final String message;
  StudentRegistrationCreationException({required this.message,});
}

class StudentRegistrationDeletionException implements StudentRegistrationException {
  StudentRegistrationDeletionException({required String message,});
}

class StudentRegistrationUpdateException implements StudentRegistrationException {
  StudentRegistrationUpdateException({required String message,});
}

class StudentRegistrationFetchingException implements StudentRegistrationException {
  final String message;
  StudentRegistrationFetchingException({required this.message,});
}