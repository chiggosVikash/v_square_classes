
import 'dart:io';
import 'dart:typed_data';

import '../../../../../../constants/enums/discount_type_enum.dart';
import '/src/features/admin/student_management/student_registration/domain/entities/student_registration_e.dart';

import '../../data/data_sources/remote/image_storage_remote_firebase.dart';
import '../../data/models/student_registration_m.dart';
import '../../data/data_sources/remote/student_registration_firebase_data_source_impl.dart';

import '../../data/repos/student_registration_repo_impl.dart';
import '/src/services/image_picker_service/image_picker_service.dart';
import '/src/services/image_picker_service/image_picker_service_impl.dart';

import '../repos/student_registration_repo.dart';

class StudentRegistrationUseCase{
  final ImagePickerService _imagePickerService;
  final StudentRegistrationRepo _studentRegistrationRepo;
  StudentRegistrationUseCase():_imagePickerService = ImagePickerServiceImpl(),
  _studentRegistrationRepo = StudentRegistarationRepoImpl(
    remoteDataSource: StudentRegistrationFirebaseDataSourceImpl(),
    imageStorageRemote: ImageStorageRemoteFirebase(),
  )
  ;


  Future<File> cameraImageMobile({required int imageQuality}) async {
    return _imagePickerService.cameraImageMobile(imageQuality: imageQuality);
  }

  Future<File> galleryImageMobile({required int imageQuality}) async {
    return _imagePickerService.galleryImageMobile(imageQuality: imageQuality);
  }

  Future<String> uploadFileImage({required File imageFile, required String path}) async{
    return _studentRegistrationRepo.uploadFileImage(imageFile: imageFile, path: path);
  }

  Future<String> uploadImageBytes({required Uint8List imageBytes, required String path}) async{
    return _studentRegistrationRepo.uploadImageBytes(imageBytes: imageBytes, path: path);
  }

  Future<String> downloadImage(String imageUrl) async{
    return _studentRegistrationRepo.downloadImage(imageUrl);
  }

 Future<bool> registerStudent({required StudentRegistrationModel studentRegistrationModel}) async{
    return _studentRegistrationRepo.registerStudent(studentRegistrationModel: studentRegistrationModel);
  }

  Future<bool> updateStudent({required StudentRegistrationModel studentRegistrationModel}) async{
    return _studentRegistrationRepo.updateStudent(studentRegistrationModel: studentRegistrationModel);
  }

  Future<bool> deleteStudent({required String registrationNo}) async{
    return _studentRegistrationRepo.deleteStudent(registrationNo: registrationNo);
  }

  Future<StudentRegistrationEntity> getStudent({required String registrationNo}) async{
    return _studentRegistrationRepo.getStudent(registrationNo: registrationNo);
  }

  Future<List<StudentRegistrationEntity>> getStudentsLazy({required int limit, required String lastRegistrationNo}) async{
    return _studentRegistrationRepo.getStudentsLazy(limit: limit, lastRegistrationNo: lastRegistrationNo);
  }

  Future<List<StudentRegistrationEntity>> getStudents({required int limit}) async{
    return _studentRegistrationRepo.getStudents(limit: limit);
  }

  Future<bool> isRegistrationNoValid({required String registrationNo}) async{
    return _studentRegistrationRepo.isRegistrationNoValid(registrationNo: registrationNo);
  }

  Future<bool> isFormNoValid({required String formNo}) async{
    return _studentRegistrationRepo.isFormNoValid(formNo: formNo);
  }







}