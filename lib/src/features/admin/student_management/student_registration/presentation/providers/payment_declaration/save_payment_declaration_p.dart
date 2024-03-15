

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/src/features/admin/student_management/student_registration/data/models/student_payment_declaration_model.dart';
import '../../../domain/usecases/student_payment_declaration_usecase.dart';

final savePaymentDeclarationProvider = AutoDisposeAsyncNotifierProvider<SavePaymentDeclarationP,bool>(()=> SavePaymentDeclarationP());

class SavePaymentDeclarationP extends AutoDisposeAsyncNotifier<bool>{
  final _studentPaymentDeclarationUseCase = StudentPaymentDeclarationUseCase();
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> savePaymentDeclaration(StudentPaymentDeclarationModel studentPaymentDeclarationModel) async{
    state = const AsyncLoading();
   try{
     final result = await _studentPaymentDeclarationUseCase.addPaymentDeclaration(
       studentPaymentDeclarationModel: studentPaymentDeclarationModel
     );
      state = AsyncData(result);
   }catch(error,stackTrace){
     state = AsyncError(error, stackTrace);
   }
  }

}