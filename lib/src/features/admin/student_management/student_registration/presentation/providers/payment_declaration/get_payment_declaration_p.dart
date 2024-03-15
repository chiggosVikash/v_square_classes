

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/data_sources/remote/student_payment_declaration_remote_data_source_impl.dart';
import '../../../data/repos/student_payment_declaration_repo_impl.dart';
import '/src/features/admin/student_management/student_registration/domain/entities/student_payment_declaration_entity.dart';

final getStudentPaymentDeclarationProvider = AutoDisposeAsyncNotifierProvider<GetPaymentDeclarationP,Map<String,StudentPaymentDeclarationEntity?>>(()=> GetPaymentDeclarationP());

class GetPaymentDeclarationP extends AutoDisposeAsyncNotifier<Map<String,StudentPaymentDeclarationEntity?>>{
  final _studentPaymentDeclarationRepo = StudentPaymentDeclarationRepoImpl(studentPaymentDeclarationRemoteDataSource: StudentPaymentDeclarationRemoteDataSourceImpl());
  @override
  FutureOr<Map<String,StudentPaymentDeclarationEntity?>> build() {
    return {};
  }

  Future<void> getPaymentDeclaration({required String registrationNo}) async{
    state = const AsyncLoading();
    try{
      final response = await _studentPaymentDeclarationRepo.getPaymentDeclaration(registrationNo: registrationNo);
      state.value?[registrationNo] = response;
      state = AsyncData(state.value!);
    } // try
    catch(error,stackTrace){
      state = AsyncError(error, stackTrace);
      if(kDebugMode){
        rethrow;
      }

    } // catch
  }

bool isPaymentDeclarationExists({required String registrationNo}) {
   final result = state.value?[registrationNo];
    if(result != null) return true;
    return false;
     // catch
  }

}