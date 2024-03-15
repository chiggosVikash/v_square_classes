
import 'dart:io';
import 'dart:typed_data';

import '../../data/models/student_registration_m.dart';

abstract interface class StudentRegistrationRepo{
   Future<bool> registerStudent({required StudentRegistrationModel studentRegistrationModel});
    Future<bool> updateStudent({required StudentRegistrationModel studentRegistrationModel});
    Future<bool> deleteStudent({required String registrationNo});
    Future<StudentRegistrationModel> getStudent({required String registrationNo});
    Future<String> uploadFileImage(
      {required File imageFile, required String path});
    Future<String> uploadImageBytes({required Uint8List imageBytes , required String path});
    Future<String> downloadImage(String imageUrl);
    Future<List<StudentRegistrationModel>> getStudentsLazy({required int limit, required String lastRegistrationNo});
    Future<List<StudentRegistrationModel>> getStudents({required int limit});
    Future<bool> isRegistrationNoValid({required String registrationNo});
    Future<bool> isFormNoValid({required String formNo});

}