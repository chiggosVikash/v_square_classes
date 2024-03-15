import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/src/exceptions/student_registration_exception.dart';
import '../../../domain/usecases/student_registration_usecase.dart';
import '/src/features/admin/student_management/student_registration/domain/entities/student_registration_entity.dart';

final getRegisteredStudentsProvider = AutoDisposeAsyncNotifierProvider<
    GetRegisteredStudentsP,
    List<StudentRegistrationEntity>>(() => GetRegisteredStudentsP());

class GetRegisteredStudentsP
    extends AutoDisposeAsyncNotifier<List<StudentRegistrationEntity>> {
  final _studentRegistrationUseCase = StudentRegistrationUseCase();
  @override
  FutureOr<List<StudentRegistrationEntity>> build() {
    return [];
  }

  Future<String?> lastRegistrationNo() async {
    return state.value?.last.registrationNo;
  }

  /// Description:
  ///
  /// Asynchronous function that retrieves a list of StudentRegistrationEntity objects from a data source.
  /// Leverages the provider pattern for state management, likely using a state notifier.
  ///
  /// Parameters:
  ///
  /// limit (required, int): Specifies the maximum number of students to fetch.
  /// Return Value:
  ///
  /// Future<List<StudentRegistrationEntity>>: A Future object that resolves to a list of StudentRegistrationEntity objects upon successful retrieval.
  ///
  /// Functionality:
  ///
  /// Sets Initial State: Sets the state to AsyncLoading, indicating that data is being fetched.
  /// Fetches Students: Attempts to fetch student data from the _studentRegistrationUseCase with the specified limit.
  /// Handles Success:
  /// If successful, updates the state to AsyncData containing the retrieved list of students.
  /// Returns the list of students.
  /// Handles Firebase Exceptions:
  /// Catches FirebaseException and throws a custom StudentRegistrationFetchingException with a user-friendly message.
  /// Handles Other Exceptions:
  /// Catches any other exceptions, updates the state to AsyncError, and re-throws the exception with a stack trace for debugging.
  /// Default Error Handling:
  /// If no specific exception is caught, throws a default StudentRegistrationFetchingException with a generic error message.
  Future<List<StudentRegistrationEntity>> getStudents(
      {required int limit}) async {
    state = const AsyncLoading();
    try {
      final students =
          await _studentRegistrationUseCase.getStudents(limit: limit);
      state = AsyncData(students);
      return students;
    } on FirebaseException catch (e) {
      throw StudentRegistrationFetchingException(
          message: e.message ?? "An error occurred while fetching students");
    } catch (e, st) {
      state = AsyncError(e, st);
    }
    throw StudentRegistrationFetchingException(
        message: "An error occurred while fetching students");
  }

  /// @description:
  ///
  /// Asynchronous function designed for lazy loading of StudentRegistrationEntity objects, fetching data in chunks based on a provided lastRegistrationNo.
  /// Employs the provider pattern for state management, likely using a state notifier.
  /// @params:
  ///
  /// limit (required, int): Specifies the maximum number of students to fetch in this iteration.
  /// lastRegistrationNo (required, String): The registration number of the last student retrieved in the previous request, used for pagination or incremental loading.
  /// Return Value:
  ///
  /// Future<List<StudentRegistrationEntity>>: A Future object that resolves to a list of StudentRegistrationEntity objects upon successful retrieval.
  ///
  /// Functionality:
  ///
  /// Handles Initial Request:
  /// If lastRegistrationNo is empty (indicating the first request), sets the state to AsyncLoading.
  /// Fetches Students: Attempts to fetch student data lazily using the _studentRegistrationUseCase.getStudentsLazy method, providing both limit and lastRegistrationNo.
  /// Updates State:
  /// If successful, updates the state to AsyncData by combining the newly retrieved students with the existing ones in the state. This ensures proper pagination and avoids duplicates.
  /// Returns the list of newly fetched students.
  /// Handles Firebase Exceptions:
  /// Catches FirebaseException, logs the error message in debug mode, and throws a custom StudentRegistrationFetchingException with a user-friendly message.
  /// Handles Other Exceptions:
  /// Catches any other exceptions, logs the error details in debug mode, updates the state to AsyncError, and re-throws the exception with a stack trace for debugging.
  /// Default Error Handling:
  /// If no specific exception is caught, throws a default StudentRegistrationFetchingException with a generic error message.
  /// Key Points:
  ///
  /// Lazy Loading: Enables fetching data in smaller chunks, improving performance and reducing initial load times, especially for large datasets.
  /// Pagination: Utilizes lastRegistrationNo as a reference point to retrieve subsequent data segments, facilitating efficient navigation through extensive datasets.
  /// State Management: Integrates with the provider pattern to manage the state and notify subscribed widgets about changes.
  Future<List<StudentRegistrationEntity>> getStudentsLazy(
      {required int limit, required String lastRegistrationNo}) async {
    if (lastRegistrationNo.isEmpty) {
      state = const AsyncLoading();
    }
    try {
      final students = await _studentRegistrationUseCase.getStudentsLazy(
          limit: limit, lastRegistrationNo: lastRegistrationNo);
      state = AsyncData([...students, ...state.value ?? []]);
      return students;

    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Error while fetching students: ${e.message}");
      }
      throw StudentRegistrationFetchingException(
          message: e.message ?? "An error occurred while fetching students");
    } catch (e, st) {
      if (kDebugMode) {
        print("Error while fetching students in catch: ${e.toString()}");
      }
      state = AsyncError(e, st);
    }
    throw StudentRegistrationFetchingException(
        message: "An error occurred while fetching students");
  }
}
