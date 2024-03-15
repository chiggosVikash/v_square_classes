
import 'dart:io';

import 'dart:typed_data';

import '../models/student_registration_model.dart';

import '../../domain/repos/student_registration_repo.dart';
import '../data_sources/remote/image_storage_remote.dart';
import '../data_sources/remote/student_registration_remote_data_source.dart';

class StudentRegistarationRepoImpl implements StudentRegistrationRepo {
 final StudentRegistrationRemoteDataSource _remoteDataSource;
 final ImageStorageRemote _imageStorageRemote;
  StudentRegistarationRepoImpl({required StudentRegistrationRemoteDataSource remoteDataSource,
  required ImageStorageRemote imageStorageRemote}) : _remoteDataSource = remoteDataSource, _imageStorageRemote = imageStorageRemote;

  @override
  Future<bool> deleteStudent({required String registrationNo}) {
    return _remoteDataSource.deleteStudent(registrationNo: registrationNo);
  }

  @override
  Future<StudentRegistrationModel> getStudent({required String registrationNo}) {
    return _remoteDataSource.getStudent(registrationNo: registrationNo);
  }

  @override
  Future<bool> registerStudent({required StudentRegistrationModel studentRegistrationModel}) {
   return _remoteDataSource.registerStudent(studentRegistrationModel: studentRegistrationModel);
  }

  @override
  Future<bool> updateStudent({required StudentRegistrationModel studentRegistrationModel}) {
    return _remoteDataSource.updateStudent(studentRegistrationModel: studentRegistrationModel);
  }

  @override
  Future<String> downloadImage(String imageUrl) {
    return _imageStorageRemote.downloadImage(imageUrl);
  }

  @override
  Future<String> uploadFileImage({required File imageFile, required String path}) {
    return _imageStorageRemote.uploadFileImage(imageFile: imageFile, path: path);
  }

  @override
  Future<String> uploadImageBytes({required Uint8List imageBytes, required String path}) {
    return _imageStorageRemote.uploadImageBytes(imageBytes: imageBytes, path: path);
  }

  @override
  Future<List<StudentRegistrationModel>> getStudentsLazy({required int limit, required String lastRegistrationNo}) {
    return _remoteDataSource.getStudentsLazy(limit: limit, lastRegistrationNo: lastRegistrationNo);
  }

  @override
  Future<List<StudentRegistrationModel>> getStudents({required int limit}) {
    return _remoteDataSource.getStudents(limit: limit);
  }

  @override
  Future<bool> isFormNoValid({required String formNo}) {
    return _remoteDataSource.isFormNoValid(formNo: formNo);
  }

  @override
  Future<bool> isRegistrationNoValid({required String registrationNo}) {
    return _remoteDataSource.isRegistrationNoValid(registrationNo: registrationNo);
  }


}