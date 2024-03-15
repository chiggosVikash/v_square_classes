

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/student_registration_usecase.dart';

final isRegistrationNoValidProvider = AutoDisposeAsyncNotifierProvider<IsRegistrationNoValidP,bool>(()=>IsRegistrationNoValidP());

class IsRegistrationNoValidP extends AutoDisposeAsyncNotifier<bool>{
  final _studentRegistrationUseCase = StudentRegistrationUseCase();

  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<bool> validateRegistrationNo(String registrationNo) async {
    // state = const AsyncLoading();
    try{
      if(registrationNo.isEmpty){
        state = const AsyncData(false);
        return false;
      }
      state = AsyncData(await _studentRegistrationUseCase.isRegistrationNoValid(registrationNo: registrationNo));
      return state.value ?? false;
    }catch(e,st){
      state = AsyncError(e, st);
      return false;
    }

  }

}