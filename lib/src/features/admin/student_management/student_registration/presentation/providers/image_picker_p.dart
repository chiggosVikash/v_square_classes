
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/exceptions/course_management_exception.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/domain/usecases/student_registration_usecase.dart';

final imagePickerProvider = AsyncNotifierProvider<ImagePickerP,File?>(()=>ImagePickerP());

class ImagePickerP extends AsyncNotifier<File?>{
  final _studentRegistrationUseCase = StudentRegistrationUseCase();
  @override
  FutureOr<File?> build() {
    return null;
  }

  Future<File?> cameraImageMobile({required int imageQuality}) async {
    state = const AsyncLoading();
    try{
      state = AsyncData(await  _studentRegistrationUseCase.cameraImageMobile(imageQuality: imageQuality));
      return state.value;
    }catch(e,st){
      state = AsyncError(ImagePickerException,st);
      if(kDebugMode){
        rethrow;
      }
      return null;

    }


  }

  Future<File?> galleryImageMobile({required int imageQuality}) async {
    state = const AsyncLoading();
    try{
      state = AsyncData(await  _studentRegistrationUseCase.galleryImageMobile(imageQuality: imageQuality));
      return state.value;
    }catch(e,st){
      state = AsyncError(ImagePickerException,st);
      if(kDebugMode){
        rethrow;
      }
      return null;

    }
  }




}