
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/student_registration_usecase.dart';

final isFormNoValidProvider = AutoDisposeAsyncNotifierProvider<IsFromNoValidP, bool>(
    () => IsFromNoValidP());

class IsFromNoValidP extends AutoDisposeAsyncNotifier<bool> {
  final _studentRegistrationUseCase = StudentRegistrationUseCase();

  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<bool> validateFormNo(String formNo) async {
    // state = const AsyncLoading();
    if(formNo.isEmpty){
      state = const AsyncData(false);
      return false;
    }
    try {
      state = AsyncData(
          await _studentRegistrationUseCase.isFormNoValid(formNo: formNo));
      return state.value ?? false;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}