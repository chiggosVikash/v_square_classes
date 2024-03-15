
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/presentation/providers/image_picker_p.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/student_registration_m.dart';

import '../../domain/usecases/student_registration_usecase.dart';

final saveStudentRegistrationProvider = AsyncNotifierProvider<SaveStudentRegistrationP,bool?>(()=> SaveStudentRegistrationP());

class SaveStudentRegistrationP extends AsyncNotifier<bool?>{
  final _studentRegistrationUsecase = StudentRegistrationUseCase();
  @override
  FutureOr<bool?> build() {
    return false;
  }

  Future<String> _uploadFileImage(
      {required File imageFile, required String path}) async{
    return await _studentRegistrationUsecase.uploadFileImage(imageFile: imageFile, path: path);
  }

  // Future<String> _uploadImageBytes(
  //     {required Uint8List imageBytes, required String path}) async{
  //   return await _studentRegistrationUsecase.uploadImageBytes(imageBytes: imageBytes, path: path);
  // }


  Future<bool> registerStudent({required StudentRegistrationModel studentRegistrationModel}) async{
    state = const AsyncLoading();
    try{
      final imageFile = await ref.read(imagePickerProvider.future);

      if(imageFile != null){
        final imageUrl = await _uploadFileImage(imageFile: imageFile, path: 'student_images/${studentRegistrationModel.registrationNo}.png');
        studentRegistrationModel = studentRegistrationModel.copyWith(basicDetails: studentRegistrationModel.basicDetails.copyWith(imageUrl: imageUrl));
      }
      state = AsyncData(await _studentRegistrationUsecase.registerStudent(studentRegistrationModel: studentRegistrationModel));
      return state.value ?? false;
    }catch(e,st){
      state = AsyncError(e, st);
      if(kDebugMode){
        print(e);
        rethrow;
      }
      return false;
    }

  }

}